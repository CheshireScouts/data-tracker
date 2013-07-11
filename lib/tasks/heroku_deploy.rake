# List of environments and their heroku git remotes
ENVIRONMENTS = {
  :staging => 'staging',
  :production => 'production',
  :github => 'github'
}

namespace :deploy do
  ENVIRONMENTS.keys.each do |env|
    desc "Deploy to #{env}"
    task env do
      current_branch = `git branch | grep ^* | awk '{ print $2 }'`.strip

      Rake::Task['deploy:before_deploy'].invoke(env, current_branch)
      Rake::Task['deploy:update_code'].invoke(env, current_branch)
      Rake::Task['deploy:after_deploy'].invoke(env, current_branch)
    end
  end

  task :before_deploy, :env, :branch do |t, args|
    puts "Deploying branch '#{args[:branch]}' to #{args[:env]}"

    status =`git status`.strip
    
    unless status.include?("nothing to commit, working directory clean")
     puts "Uncommitted changes in working directory"
     puts status
     Rake::Task['deploy:abandon_deploy'].invoke 
    end

    if (args[:env] == :production && args[:branch] != 'master') || (args[:env] == :staging && args[:branch] != 'develop')
      print "Are you sure you want to deploy branch '#{args[:branch]}' to #{args[:env]}? (y/n) " and STDOUT.flush
      char = $stdin.getc
      if char != ?y && char != ?Y
        Rake::Task['deploy:abandon_deploy'].invoke 
      end
    end

  end

  task :after_deploy, :env, :branch do |t, args|
    puts "Deployment Complete"
  end

  task :abandon_deploy do
    puts "--"
    puts "Deployment Aborted"
    exit 
  end

  task :update_code, :env, :branch do |t, args|
    FileUtils.cd Rails.root do
      puts "Updating #{ENVIRONMENTS[args[:env]]} from branch '#{args[:branch]}'"
      `git push #{ENVIRONMENTS[args[:env]]} +#{args[:branch]}:master`

      if args[:branch] == 'master' || args[:branch] == 'develop'
        print "Also push changes to Github? (y/n)" and STDOUT.flush
        char = $stdin.getc
        if char == ?y || char == ?Y
          `git push #{ENVIRONMENTS[:github]} #{args[:branch]}`
        end
      end

    end
  end

end