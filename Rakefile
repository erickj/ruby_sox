#!/usr/bin/env rake
require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "cucumber/rake/task"

desc "Default: run specs"
task :default => :spec

namespace :test do
  desc "Run specs"
  RSpec::Core::RakeTask.new do |t|
    t.pattern = "./spec/**/*_spec.rb"
  end

  desc "Run cukes"
  Cucumber::Rake::Task.new
end
