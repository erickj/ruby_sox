require "spec/spec_helper"

describe RubySox::Effect do
  it "throws invalid ruby exception for bogus effects" do
    lambda { RubySox::Effect.new('foobar') }.should raise_error
  end

  it "parses itself from an effect string" do
    e = RubySox::Effect.parse("reverse")
    e.name.should equal("reverse")
  end

  context "valid effect" do
    before :each do
    end
  end
end
