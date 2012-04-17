require 'thor'
require 'fileutils'

module RubySox
  class CLI < Thor
    desc "convert <input> <output_format> [norm]", "performs encoding conversion from input to output_format"
    def convert(input_file, output, norm=-2)
      unless File.exists?(input_file)
        throw Errno::ENOENT.new("no such file %s in %s"%[input_file, FileUtils.pwd])
      end

      if RubySox.is_file_format?(output)
        dir = dirname_from_file(input_file)
        output = File.join(dir, base_without_ext_from_file(input_file) << "." << output)
      end

      RubySox.exec_no_capture "--norm=%d"%norm, input_file, output
    end

    desc "effect <effect> <input>", "perform the effect to <input>"
    def effect(effect_raw, input_file)
      unless File.exists?(input_file)
        throw Errno::ENOENT.new("no such file %s in %s"%[input_file, FileUtils.pwd])
      end

      effect = RubySox.effect(effect_raw)

      dir = dirname_from_file(input_file)
      ext = extname_from_file(input_file)
      output = File.join(dir, base_without_ext_from_file(input_file) << "." << effect.name << ext)

      RubySox.exec_no_capture input_file, output, effect
      exit $?.exitstatus if $?.exitstatus > 0
    end

    desc "info <input>", "returns sox info for the <input> file"
    def info(*args)
      RubySox.exec_no_capture ["--info"].concat(args)
      exit $?.exitstatus if $?.exitstatus > 0
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

