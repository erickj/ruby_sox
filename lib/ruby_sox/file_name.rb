module RubySox
  class FileName
    def initialize(file_name)
      @fn = file_name
    end

    def to_s
      @fn
    end
  end
end

RubySox::FileName::STDIN = RubySox::FileName.new("-")
