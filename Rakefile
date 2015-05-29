require 'rake/testtask'
require 'rubocop/rake_task'

Rake::TestTask.new do |task|
  task.pattern = 'test/*_test.rb'
end

desc 'Run rubocop'
task :rubocop do
  RuboCop::RakeTask.new
end

desc 'Run App'
task :run do
  ruby 'rock_paper_scissors_lizard_spock_oop.rb'
end

task default: :run
