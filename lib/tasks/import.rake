namespace :import do
  desc "Imports Census Data"
  task :census => :environment do |t, args|


    census = CensusImporter.new
    census.create_memberships

  end
end