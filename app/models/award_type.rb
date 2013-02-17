class AwardType < ActiveRecord::Base
  belongs_to :scout_type
  attr_accessible :code, :name, :scout_type, :scout_type_id
end
