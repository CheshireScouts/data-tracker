namespace :update do
  desc "Update Award Types with Scout Type"
  task :award_types => :environment do |t, args|
    AwardType.find_by_code('BRONZE').update_attribute(:scout_type, ScoutType.find_by_code('BEAVERS'))
    AwardType.find_by_code('SILVER').update_attribute(:scout_type, ScoutType.find_by_code('CUBS'))
    AwardType.find_by_code('GOLD').update_attribute(:scout_type, ScoutType.find_by_code('SCOUTS'))
    AwardType.find_by_code('DIAMOND').update_attribute(:scout_type, ScoutType.find_by_code('EXPLORERS'))
    AwardType.find_by_code('PLATINUM').update_attribute(:scout_type, ScoutType.find_by_code('EXPLORERS'))
    AwardType.find_by_code('QUEEN').update_attribute(:scout_type, ScoutType.find_by_code('EXPLORERS'))
  end

end