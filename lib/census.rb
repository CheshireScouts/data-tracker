
class Census

  def initialize(year)
    @agent = Mechanize.new
    @year = year
    @username = ENV['CENSUS_USERNAME']
    @password = ENV['CENSUS_PASSWORD']
    @main_page = get_main_page
  end

  def get_membership_for_unit(unit)
    units = {
      "beavers" => {"row" => 5, "column" => 10}
    }
    return get_contents_from_cell(units[unit]["row"], units[unit]["column"])
  end

  def get_contents_from_cell(row, column)
    xpath = "/html/body/table/tr[3]/td[1]/table/tr[#{row}]/td[#{column}]"
    return @main_page.at(xpath).text.strip.split
  end

  def get_main_page
    @agent.get(get_url)
    form = @agent.page.forms.first
    form.username = @username
    form.password = @password
    form.submit
    page = @agent.page.link_with(:text => @year).click
  end

  def get_url
    return "http://census.sbuk.org.uk"
  end

end