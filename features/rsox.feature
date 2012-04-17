# cucumber documentation: http://cukes.info/
# aruba cucumber predefines: https://github.com/cucumber/aruba/blob/master/lib/aruba/cucumber.rb
Feature: RSox
  In order to make an easy to use dialect for sox
  As an executable
  I want to be as terse as possible

  Scenario: ask for command line help
    When I run `rsox help`
    Then the stdout should contain "help"
    Then the stdout should contain "convert"
    Then the stdout should contain "info"
    Then the exit status should be 1

  Scenario: convert file format
    When I run `rsox convert test_data/test.mp3 to wav`
    Then a file named "test_data/test.wav" should exist
