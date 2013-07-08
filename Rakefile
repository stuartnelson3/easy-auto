require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib/easy-auto'
  t.test_files = FileList['test/lib/easy-auto/*_test.rb']
  t.verbose = true
end

task :default => :test
