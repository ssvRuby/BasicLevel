
module Validation

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethod
  end

  module ClassMethods

    def validate(name, *args)
      instance_variable_set('@vld', {})
      instance_variable_get('@vld')[name] = *args
    end

  end

  module InstanceMethod

    def validate!
      self.class.instance_variable_get('@vld').each do |name, args|
        value = instance_variable_get("@#{name}").to_sym
        send("validate_#{args[0]}", value, args[1])
      end
    end

    def validate_presence(value, *args)
      raise  Exception, 'Attributes type is nil or empty !' if value.nil? || value.empty?
    end

    def validate_format(value, format)
      raise Exception, 'Attribute is invalid format!' if value !~ format
    end

    def validate_type(value, type)
      raise Exception 'Attribute is invalid type!' unless value.is_a?(type)
    end

    def valid?
      validate!
    rescue
      false
    end

  end
end


