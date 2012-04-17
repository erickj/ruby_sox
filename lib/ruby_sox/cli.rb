require 'thor'
require 'fileutils'

module RubySox
  class CLI < Thor
    desc "convert <input> <output_format>", "performs encoding conversion from input to output_format"
    def convert(input_file, output)
      unless File.exists?(input_file)
        throw Errno::ENOENT.new("no such file %s in %s"%[input_file, FileUtils.pwd])
      end

      if RubySox.is_file_format?(output)
        dir = dirname_from_file(input_file)
        output = File.join(dir, base_without_ext_from_file(input) << "." << output)
      end

      RubySox.exec_capture input_file, output
    end

    desc "info <input>", "returns sox info for the <input> file"
    def info(*args)
      RubySox.exec_no_capture ["--info"].concat(args)
    end

    private
    def dirname_from_file(file)
      File.dirname(file)
    end

    def extname_from_file(file)
      File.extname(file)
    end

    def base_without_ext_from_file(file)
      File.basename(file).split('.').first
    end
  end
end

