class CensusFormat < ActiveRecord::Base
  has_many :census_table_formats, :class_name => "CensusTableFormat"
  attr_accessible :name, :table_xpath
end
