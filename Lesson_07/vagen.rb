require_relative 'manufakturer'
class Vagen
  include Manufakturer
  attr_reader :type

  @@all_vagen = Array.new

  def self.all
    @@all_vagen
  end

  def self.show_all
    @@all_vagen.each {|v| puts "Вагон ID: #{v.itself.__id__}"}
  end

  def initialize
    @@all_vagen << self.itself
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
