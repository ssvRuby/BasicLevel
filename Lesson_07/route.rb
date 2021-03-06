#---------------------------------------------------------------------------
#  class Route:
#  Может добавлять промежуточную станцию в список
#  Может удалять промежуточную станцию из списка
#  Может выводить список всех станций по-порядку от начальной до конечной
#---------------------------------------------------------------------------
class Route

  attr_reader :station_list

  def initialize (first_station, end_station)
    @station_list = Array.new
    @station_list << first_station
    @station_list << end_station
    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  def add_station (station)
    self.station_list.insert(-2, station) unless self.station_list.include?(station)
  end

  def del_station (station)
    self.station_list.delete(station) if self.station_list.include?(station)
  end

  def show_route
    self.station_list.each { |s| puts s.name }
  end

  def next(current)
    self.station_list.at(self.station_list.index(current) + 1) if current != self.station_list.last
  end

  def prev(current)
    self.station_list.at(self.station_list.index(current) - 1) if current != self.station_list.first
  end

  protected

  def validate!
    raise "First Station name is nil!" if self.station_list[0].nil?
    raise "End Station name is nil!" if self.station_list[1].nil?
  end

end
