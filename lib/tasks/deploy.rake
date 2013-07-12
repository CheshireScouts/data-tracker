require 'colorize'

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

      puts "Running test specs"
      Rake::Task['test:spec'].invoke

      puts "All test specs passed"
      puts "Validating git status"
      Rake::Task['deploy:before_deploy'].invoke(env, current_branch)

      puts "Deploying branch '#{args[:branch]}' to #{args[:env]}"
      Rake::Task['deploy:update_code'].invoke(env, current_branch)
      
      Rake::Task['deploy:after_deploy'].invoke(env, current_branch)
      complete_deploy(env, current_branch)
    end
  end

  task :before_deploy, :env, :branch do |t, args|
    
    status =`git status`.strip 
    unless status.include?("nothing to commit, working directory clean")
     print_message :error, "Uncommitted changes in working directory"
     abandon_deploy(args[:env], args[:branch])
    end

    if (args[:env] == :production && args[:branch] != 'master') || (args[:env] == :staging && args[:branch] != 'develop')
      print "Are you sure you want to deploy branch '#{args[:branch]}' to #{args[:env]}? (y/n) " and STDOUT.flush
      char = $stdin.getc
      if char != ?y && char != ?Y
        abandon_deploy(args[:env], args[:branch])
      end
    end

  end

  task :after_deploy, :env, :branch do |t, args|
  end


  task :update_code, :env, :branch do |t, args|
    FileUtils.cd Rails.root do
      `git push #{ENVIRONMENTS[args[:env]]} +#{args[:branch]}:master`

      if args[:branch] == 'master' || args[:branch] == 'develop'
        print "Also push changes to Github? (y/n)" and STDOUT.flush
        char = $stdin.getc
        if char == ?y || char == ?Y
          puts "Pushing branch '#{args[:branch]}' to Github"
          `git push #{ENVIRONMENTS[:github]} #{args[:branch]}`
        end
      end

    end
  end

  def complete_deploy(env, branch)
    print_message :footer, "Completed deployment of branch '#{args[:branch]}' to #{ENVIRONMENTS[args[:env]]}"
  end

  def abandon_deploy(env, branch)
    print_message :footer, "Abandoned deployment of branch '#{branch}' to #{env}"
    exit
  end

  def print_message(type, message)
    if type == :footer
      80.times {print "-"}
      puts "\n#{message}"
      80.times {print "-"}
    end

    if type == :error
      puts "ERROR: #{message}".red
    end
  end

end