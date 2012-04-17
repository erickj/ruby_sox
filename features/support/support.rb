require "aruba/cucumber"
require "fileutils"

Given /^a copy of test data named "([^"]*)"$/ do |file_name|       #" hide emacs regex parse error
  write_file(file_name, File.read(File.join(ENV['TD_ROOT'],file_name)))
end
