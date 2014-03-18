require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'test/unit/spec/*/*_spec.rb'
end

task :default => :spec
