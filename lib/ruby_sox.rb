require "ruby_sox/version"
require "ruby_sox/file_name"
require "ruby_sox/constants"

module RubySox
  include RubySox::Constants
  SOX_EXEC = ENV['SOX_EXEC'] || '/usr/local/bin/sox'

  def self.is_file_format?(format)
    self.const_defined?("AF_%s"%format.upcase)
  end

  def self.is_effect?(effect)
    self.const_defined?("EF_%s"%effect.upcase)
  end

  def self.exec_capture(*args)
    command(SOX_EXEC, true, args)
  end

  def self.exec_no_capture(*args)
    command(SOX_EXEC, false, args)
  end

  private

  def self.command(com, capture, *args)
    arg_str = args.join(' ')
    unless capture
      system("%s %s"%[com,arg_str])
    else
      %x(#{com} "#{arg_str}").chomp
    end
  end
end
