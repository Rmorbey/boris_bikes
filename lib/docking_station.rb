require_relative 'bike'

class DockingStation 
 
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bike available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Capacity reached' if full?
    @bikes << bike
    bike
  end

  private
  def full?
    @bikes.length >= 20
  end

  def empty?
    @bikes.empty?
  end
end


