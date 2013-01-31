class ReportsController < ApplicationController
  require 'httparty'
  load_and_authorize_resource

  before_filter :set_open_issues

  def awards
  end

  def membership
  end

  protected
    def set_open_issues
      @issues = JSON.parse HTTParty.get('https://api.github.com/repos/CheshireScouts/data-tracker/issues?state=open&labels=Reporting').response.body
    end

end
