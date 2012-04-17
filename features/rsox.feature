Feature: RSox
  In order to make an easy to use dialect for sox
  As a CLI
  I want to be as terse as possible

  Scenario: convert file format
    When I run "rsox convert test_data/test.mp3 to wav"
    Then the file should be converted to "test_data/test.wav"
