require_relative 'manufakturer'

#-------------------------------------------------------------------------------------------
# class Train
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов,
# эти данные указываются при создании экземпляра класса
# Может набирать скорость
# Может показывать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может показывать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто
# увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может
# осуществляться только если поезд не движется.
# Может принимать маршрут следования (объект класса Route)
# Может перемещаться между станциями, указанными в маршруте.
# Показывать предыдущую станцию, текущую, следующую, на основе маршрута
#-------------------------------------------------------------------------------------------

class Train

  include Manufakturer

  attr_accessor :type,
                :vagen_qty,
                :speed,
                :curr_station,
                :route,
                :vagens

  attr_reader :vagen_id

  @@all_train = Array.new

  def self.find(vagen_id)
    result = nil
    @@all_train.each do |t|
      if t.vagen_id == vagen_id then
        result = t
        break
      end
    end
    return result
  end

  def initialize (vagen_id, type, vagen_qty)
    @vagen_id = vagen_id
    @type = type
    @speed = 0
    @vagens = Array.new
    @@all_train << self.itself
  end

  def speed_up (s)
    self.speed += s
  end

  def show_current_speed
    puts self.speed
  end

  def brake
    self.speed = 0
  end

  def show_vagens_count
    self.vagens.length
  end

  def add_vagen (vagen)
    if self.speed == 0 && is_same_type?(vagen) then
      self.vagens << vagen
    end
  end

  def del_vagen
    if self.speed == 0 && self.vagens.length > 0 then
      self.vagens.pop
    end
  end

  def is_same_type?(vagen)
    self.type == vagen.type
  end

  def set_route(route)
    self.route = route
    self.curr_station = route.station_list[0]
  end

  def next_station
    self.route.next(self.curr_station)
  end

  def prev_station
    self.route.prev(self.curr_station)
  end

  def show_current_station
    puts self.curr_station.name
  end

  def show_next_station
    puts self.route.next(self.curr_station).name
  end

  def show_prev_station
    puts self.route.prev(self.curr_station).name
  end

  def go
    if (self.curr_station != self.route.station_list.last) then
      self.curr_station = self.route.next(self.curr_station)
    else
      puts 'The end!'
    end
  end
end