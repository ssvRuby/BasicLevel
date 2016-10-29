require_relative 'manufakturer'
require_relative 'cargo_vagen'
require_relative 'pass_vagen'
require_relative 'validation'

class Train
  NUMBER_FORMAT = /^[a-z\d]{3}[-]?[a-z\d]{2}$/i

  include Manufakturer
  include Validation

  attr_accessor :type,
                :vagen_qty,
                :speed,
                :curr_station,
                :route,
                :vagens

  attr_reader :vagen_id

  validate :vagen_id, :format, NUMBER_FORMAT

  @@all_train = []

  def self.all
    @@all_train
  end

  def self.show_all
    @@all_train.each { |t| puts "№ #{t.vagen_id},#{t.type},ваг:#{t.vagen_qty}" }
  end

  def self.find(vagen_id)
    result = nil
    @@all_train.each do |t|
      if t.vagen_id == vagen_id
        result = t
        break
      end
    end
    result
  end

  def initialize(vagen_id, type, vagen_qty)
    @vagen_id = vagen_id
    @type = type
    @speed = 0
    @vagen_qty = vagen_qty
    @@all_train << self
    @vagens = []
    for i in 1..vagen_qty do
      if @type == 'pass' then
        @vagens << PassVagen.new
      elsif
        @type == 'cargo' then
        @vagens << CargoVagen.new
      end
    end
  end

  def go_trought(&block)
    self.vagens.each do |v|
      yield(v)
    end
  end

  def speed_up(s)
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

  def show_vagens
    puts "Поезд #{self.vagen_id}"
    n = 1
    self.vagens.each { |v|
      puts "вагон № #{n}, свободно #{v.free_places}" +
               " занято #{v.busy_places}" if v.type.to_s == "pass"
      puts "вагон № #{n}, свободно #{v.free_volume}" +
               " занято #{v.busy_volume}" if v.type.to_s == 'cargo'
      n += 1
    }
  end

  def add_vagen(vagen)
    if self.speed.zero? && same_type?(vagen)
      self.vagens << vagen
      self.vagen_qty += 1
    end
  end

  def del_vagen
    if self.speed.zero? && !self.vagens.empty?
      self.vagens.pop
      self.vagen_qty -= 1
    end
  end

  def same_type?(vagen)
    self.type == vagen.type
  end

  def st_route(route)
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
    if self.curr_station != self.route.station_list.last
      self.curr_station = self.route.next(self.curr_station)
    else
      puts 'The end!'
    end
  end

end
