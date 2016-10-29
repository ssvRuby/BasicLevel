
class Route

  attr_reader :station_list

  def initialize(first_station, end_station)
    @station_list = []
    @station_list << first_station
    @station_list << end_station
  end

  def add_station(station)
    self.station_list.insert(-2, station) unless
        self.station_list.include?(station)
  end

  def del_station(station)
    self.station_list.delete(station) if self.station_list.include?(station)
  end

  def show_route
    self.station_list.each { |s| puts s.name }
  end

  def next(current)
    self.station_list.at(self.station_list.index(current) + 1) if
        current != self.station_list.last
  end

  def prev(current)
    self.station_list.at(self.station_list.index(current) - 1) if
        current != self.station_list.first
  end

end
