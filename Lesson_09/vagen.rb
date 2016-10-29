require_relative 'manufakturer'

class Vagen
  include Manufakturer

  attr_reader :type

  @@all_vagen = []

  def self.all
    @@all_vagen
  end

  def self.show_all
    @@all_vagen.each { |v| puts "Вагон ID: #{v.itself.__id__}" }
  end

  def initialize
    @@all_vagen << self.itself
  end

end
