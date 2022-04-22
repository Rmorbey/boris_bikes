require_relative 'bike'

class DockingStation 
 
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bike available' if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Capacity reached' if @bikes.length >= 20
    @bikes << bike
    bike
  end

end


