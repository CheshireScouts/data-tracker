class CensusImporter

  def initialize
    @agent = Mechanize.new
    @username = ENV['CENSUS_USERNAME']
    @password = ENV['CENSUS_PASSWORD']
  end

  def create_memberships_for_all_groups(login_year)
    @main_url = "http://census#{@login_year}.sbuk.org.uk"
    login
    OrganisationType.find_by_code("GROUP").organisations.each do |group|
      @group = group
      create_memberships_for_group
    end
  end

  def create_memberships_for_group
    Year.find(:all).each do |year|
        unless year.census_format.nil?
          @census_year = year
          @census_format = year.census_format
          create_memberships_for_group_and_year
        end
    end
  end

  def create_memberships_for_group_and_year
    get_page_for_group
    if @group_return_page.nil?
      puts "No page found for #{@group.registration_no} #{@census_year.name}"
    else
      delete_memberships_for_group_and_year
      @census_format.census_table_formats.each do |cell|
        create_memberships_from_table_cell(cell)
      end
    end
  end

protected
    def create_memberships_from_table_cell(cell)    
      
      male_head_count = get_head_counts_from_cell(cell)[1]
      female_head_count = get_head_counts_from_cell(cell)[2]

      if male_head_count =~ /\d+/
        Membership.create(organisation: @group, scout_type: cell.scout_type, membership_type: cell.membership_type, year: @census_year, gender: 'M', head_count: male_head_count)
      end

      if female_head_count =~ /\d+/
        Membership.create(organisation: @group, scout_type: cell.scout_type, membership_type: cell.membership_type, year: @census_year, gender: 'F', head_count: female_head_count)
      end
    end

    def get_page_for_group
      page = @agent.get(get_url_for_group_and_year)
      unless page.at('/html/head/title').text.downcase.include? "error"
        @group_return_page = page
      end
    end
      
    def get_head_counts_from_cell(cell)
      xpath = @census_format.table_xpath + "tr[#{cell.row}]/td[#{cell.column}]"
      doc = @group_return_page.parser
      doc.search('br').each do |n|
        n.replace(" ")
      end
      return doc.xpath(xpath).text.split
    end

    def get_url_for_group_and_year
      return "#{@main_url}/index.php/view/2#{@group.registration_no}/#{@census_year.name}"
    end

    def delete_memberships_for_group_and_year
      Membership.where(:organisation_id => @group, :year_id => @census_year).delete_all
    end

    def login
      @agent.get(@main_url)
      form = @agent.page.forms.first
      form.type = 'c'
      form.username = @username
      form.password = @password
      form.submit
    end

end