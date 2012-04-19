require "ruby_sox/version"
require "ruby_sox/constants"

require "ruby_sox/file_name"
require "ruby_sox/effect"


module RubySox
  include RubySox::Constants
  SOX_EXEC = ENV['SOX_EXEC'] || '/usr/local/bin/sox'

  def self.effect(effect_string)
    RubySox::Effect.parse(effect_string)
  end

  def self.is_file_format?(format)
    self.const_defined?("AF_%s"%format.to_s.upcase)
  end

  def self.is_effect?(effect)
    self.const_defined?("EF_%s"%effect.to_s.upcase)
  end

  def self.exec_capture(*args)
    sox_command(true, args)
  end

  def self.exec_no_capture(*args)
    sox_command(false, args)
  end

  private

  def self.sox_command(capture, *args)
    command(SOX_EXEC, capture, args)
  end

  def self.command(com, capture, *args)
    arg_str = args.join(' ')
    unless capture
      system("%s %s"%[com,arg_str])
    else
      %x(#{com} "#{arg_str}").chomp
    end
  end
end
