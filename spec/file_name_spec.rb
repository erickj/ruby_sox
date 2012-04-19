require "spec_helper"

describe RubySox::FileName do
  context "is a regular file" do
    it "prints itself to_s" do
      i = RubySox::FileName.new("/tmp/foo.bar")
      i.to_s.should eq("/tmp/foo.bar")
    end
  end

  context "is stdin" do
    it "is a constant" do
      i = RubySox::FileName::STDIN
      i.class.should equal(RubySox::FileName)
    end

    it "should equal -" do
      RubySox::FileName::STDIN.to_s.should eq("-")
    end
  end
end
