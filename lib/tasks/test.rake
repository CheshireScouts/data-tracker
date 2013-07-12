
require 'rspec/core/rake_task'

namespace :test do
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.verbose = false
    t.fail_on_error = true
    ENV['COVERAGE'] = "true"
  end

end