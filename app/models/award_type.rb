class AwardType < ActiveRecord::Base
  attr_accessible :code, :name
  validates_presence_of :code, :name
end
