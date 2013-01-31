namespace :import do
  desc "Imports Census Data"
  task :census => :environment do |t, args|


    census = Census.new("2013")
    puts census.get_membership_for_unit("beavers")

  end
end