require "spec/spec_helper"

describe RubySox::Effect do
  it "should respond to effect is_effect?" do
    RubySox.should respond_to :is_effect?
  end

  it "should confirm any effect defined as a constant EF_FOOBAR is an effect" do
    RubySox::EF_FOOBAR = "foobar"
    RubySox.is_effect?("foobar").should be true
    RubySox.is_effect?(:foobar).should be true
  end

  it "should respond to effect is_file_format?" do
    RubySox.should respond_to :is_file_format?
  end

  it "should confirm any format defined as a constant AF_FOOBAR is a file format" do
    RubySox::AF_FOOBAR = "foobar"
    RubySox.is_file_format?("foobar").should be true
    RubySox.is_file_format?(:foobar).should be true
  end
end
