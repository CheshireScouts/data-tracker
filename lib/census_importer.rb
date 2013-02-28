class CensusImporter

  def initialize
    @agent = Mechanize.new
    @username = ENV['CENSUS_USERNAME']
    @password = ENV['CENSUS_PASSWORD']
    @main_url = "http://census.sbuk.org.uk"
    login  
  end

  def create_memberships
    create_memberships_for_all_districts
    create_memberships_for_all_groups
  end

  def create_memberships_for_all_districts
    if @login_status
      OrganisationType.find_by_code("DISTRICT").organisations.each do |district|
        create_memberships_for_district(district)
      end
    end
  end

  def create_memberships_for_all_groups
    if @login_status
      OrganisationType.find_by_code("GROUP").organisations.each do |group|
        create_memberships_for_group(group)
      end
    end
  end

  def create_memberships_for_group(group)
    if @login_status
      Year.find(:all).each do |year|
          unless year.group_census_format.nil?
            create_memberships_for_organisation_and_year(group, year)
          end
      end
    end
  end

  def create_memberships_for_district(district)
    if @login_status
      Year.find(:all).each do |year|
          unless year.district_census_format.nil?
            create_memberships_for_organisation_and_year(district, year)
          end
      end
    end
  end

  def create_memberships_for_organisation_and_year(organisation, year)
    if @login_status
      @organisation = organisation
      @year = year
      @organisation_return_page = get_page_for_organisation_and_year

      case @organisation.organisation_type.code
        when "GROUP" then
          @census_format = year.group_census_format
        when "DISTRICT" then
          @census_format = year.district_census_format
        else
          puts "No valid organisation type found for #{@organisation.registration_no}"
      end

      if @organisation_return_page.nil?
        puts "No page found for #{@organisation.registration_no} #{year.name}"
      else
        Membership.where(:organisation_id => @organisation, :year_id => @year).delete_all
        @census_format.census_table_formats.each do |cell|
          create_memberships_from_table_cell(cell)
        end
      end
    end
  end

private
    def create_memberships_from_table_cell(cell)    
      male_head_count = get_head_counts_from_cell(cell)[1]
      female_head_count = get_head_counts_from_cell(cell)[2]

      if male_head_count =~ /\d+/
        Membership.create(
          organisation: @organisation, 
          scout_type: cell.scout_type, 
          membership_type: cell.membership_type, 
          year: @year, gender: 'M', 
          head_count: male_head_count)
      end

      if female_head_count =~ /\d+/
        Membership.create(
          organisation: @organisation, 
          scout_type: cell.scout_type, 
          membership_type: cell.membership_type, 
          year: @year, gender: 'F', 
          head_count: female_head_count)
      end
    end
      
    def get_head_counts_from_cell(cell)
      xpath = @census_format.table_xpath + "tr[#{cell.row}]/td[#{cell.column}]"
      doc = @organisation_return_page.parser
      doc.search('br').each do |n|
        n.replace(" ")
      end
      return doc.xpath(xpath).text.split
    end

    def get_page_for_organisation_and_year
      page = @agent.get(get_url_for_organisation_and_year)
      unless page.at('/html/head/title').text.downcase.include? "error"
        return page
      end
    end

    def get_url_for_organisation_and_year
      return "#{@main_url}/index.php/view/#{@organisation.census_url_no}/#{@year.name}"
    end 

    def login
      @agent.get(@main_url)
      form = @agent.page.forms.first
      form.type = 'c'
      form.username = @username
      form.password = @password
      page = form.submit
      if page.parser.include?("The details you entered were incorrect")
        @login_status = false
        puts "Could not login"
      else
        @login_status = true
      end
    end

end