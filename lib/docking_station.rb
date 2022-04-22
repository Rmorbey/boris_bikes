require_relative 'bike'

class DockingStation 
 
  attr_reader :bike



  def release_bike
    fail 'No bike available' unless @bike
    @bike
  end

  def dock(bike)
    fail 'Capacity reached' if @bike
    @bike = bike
  end

end


