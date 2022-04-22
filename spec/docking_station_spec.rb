require 'docking_station'

describe DockingStation do
  it { expect(subject).to respond_to :release_bike }

  describe '#release_bike' do

    it 'releases working bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

  end

  describe '#dock(bike)' do

    it 'dock bike at docking station' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'raises an error when docking station reaches capacity' do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Capacity reached'
    end

  end

  it 'is there a bike at the docking station' do
    bike = Bike.new
    subject.dock(bike) 
    expect(subject.bikes).to eq bike
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Capacity reached'
    end
  end

  
end
