require_relative 'manufakturer'
class Vagen
  include Manufakturer
  attr_reader :type

  def initialize
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "Manufakturer is nil!" if self.manufakturer.nil?
    raise "Vagen type is nil!" if self.type.nil?
  end
end