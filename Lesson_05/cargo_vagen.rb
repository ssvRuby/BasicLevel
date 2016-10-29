require_relative 'vagen'

class CargoVagen < Vagen
  def initialize
    @type = :cargo
  end
end