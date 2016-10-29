require_relative 'vagen'

class CargoVagen < Vagen
  attr_reader :all_volume,
              :free_volume,
              :busy_volume

  def initialize(all_volume = 180)
    @all_volume = all_volume
    @free_volume = all_volume
    @busy_volume = 0
    @type = :cargo
    @@all_vagen << self.itself
  end

  def take_volume(volume)
    if self.free_volume > volume
      self.busy_volume += volume
      self.free_volume -= volume
      puts "Осталось #{self.free_volume} m3 свободного объема"
    else
      puts "Достаточного свободного объема в вагоне нет!"
    end
  end

  def show_free_volume
    self.free_volume
    puts "В вагоне #{self.itself} #{self.free_volume} m3 свободного объема"
  end

  def show_busy_volume
    self.busy_volume
    puts "В вагоне #{self.itself} #{self.busy_volume} m3 занятого объема"
  end

  protected

  attr_writer :free_volume,
              :busy_volume
end
