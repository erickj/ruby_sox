module RubySox
  class InvalidEffectException < StandardError; end

  class Effect
    attr_accessor :name, :options

    def self.parse(effect_string)
      name,options = effect_string.split(' ',2)
      self.new(name,options)
    end

    def initialize(name, options)
      throw InvalidEffectException.new("Invalid Effect: %s"%name) unless RubySox.is_effect?(name)
      @name = name
      @options = options
    end

    def to_s
      "%s %s"%[name, options]
    end
  end
end
