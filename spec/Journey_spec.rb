require "Journey.rb"

describe Journey do

  subject(:journey) {described_class.new(:station)}

  it "returns an entry station" do
    expect(journey.entry_station).to eq :station
  end

  it "should state that the journey has started" do
    expect(journey).not_to be_complete
  end

  it "should state that the journey has finished" do
    journey.finish(:station)
    expect(journey).to be_complete
   end

  it "should charge the penalty if no exit station given" do
    journey.finish
    expect(journey.fare).to eq Journey::PENALTY
  end

  it 'should charge minimum fare if journey complete' do
    journey.finish(:station)
    expect(journey.fare).to eq Journey::MINIMUM_FARE
  end

  it "should be able to change the exit station" do
    journey.change_in_station(:station)
    expect(journey.exit_station).to eq :station
  end

end
