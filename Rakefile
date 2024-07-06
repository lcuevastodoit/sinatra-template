require 'rubygems'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = ['-c', '-f d', '-r ./spec/spec_helper.rb']
  task.pattern    = 'spec/**/*_spec.rb'
end

task default: :spec
