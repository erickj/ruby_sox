# cucumber documentation: http://cukes.info/
# aruba cucumber predefines: https://github.com/cucumber/aruba/blob/master/lib/aruba/cucumber.rb
Feature: RSox
  In order to make an easy to use dialect for sox
  As a CLI
  I want to be as terse as possible

  Scenario: ask for command line help
    When I run `rsox help`
    Then the stdout should contain "help"
    Then the stdout should contain "convert"
    Then the stdout should contain "info"

  Scenario: info
    Given a copy of test data named "test.mp3"
    When I run `rsox info test.mp3`
    Then the stdout should contain "44100"
    Then the stdout should contain "mp3"
    Then the exit status should be 0

  Scenario: convert file format
    Given a copy of test data named "test.mp3"
    When I run `rsox convert tmp/aruba/test.mp3 wav`
    Then the output should contain "tmp/aruba/test.wav created"
    Then a file named "tmp/aruba/test.wav" should exist
    Then the exit status should be 0
