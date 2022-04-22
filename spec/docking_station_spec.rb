require 'docking_station'

describe DockingStation do
  it { expect(subject).to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases working bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  it 'dock bike at docking station' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'is there a bike at the docking station' do
    bike = Bike.new
    subject.dock(bike) 
    expect(subject.bike).to eq bike
  end

  it 'raises an error when there are no bikes' do
    expect { subject.release_bike }.to raise_error 'No bike available'
  end


end


#As a member of the public,
#So that I am not confused and charged unnecessarily,
#I'd like docking stations not to release bikes when there are none available.