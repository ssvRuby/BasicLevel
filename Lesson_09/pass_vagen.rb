require_relative 'vagen'

class PassVagen < Vagen
  attr_reader :all_places,
              :free_places,
              :busy_places

  def initialize(all_places = 36)
    @all_places = all_places
    @free_places = all_places
    @busy_places = 0
    @type = :pass
    @@all_vagen << self.itself
  end

  def take_place
    if self.free_places > 0
      self.busy_places += 1
      self.free_places -= 1
      puts "Осталось #{self.free_places} свободных мест"
    else
      puts "Свободных мест в вагоне нет!"
    end
  end

  def show_free_places
    self.free_places
    puts "В вагоне #{self.itself} #{self.free_places} свободных мест"
  end

  def show_busy_places
    self.busy_places
    puts "В вагоне #{self.itself} #{self.busy_places} занятых мест"
  end

  protected

  attr_writer :free_places,
              :busy_places
end
