require './spec_helper'

describe Batteries do
  before :each do
    @Batteries = Batteries.new
  end

  it "should be an item" do
    expect(@Batteries).to be_an(Item)
  end

  it "has name 'Batteries'" do
    expect(@Batteries.name).to eq("Batteries")
  end

  it "has 25 weight" do
    expect(@Batteries.weight).to eq(25)
  end

  describe "#charge" do
    it "recharges the robots shields" do
      @robot = Robot.new
      expect(@robot).to receive(:charge)
      @Batteries.charge(@robot)
    end
  end
end

require './spec_helper'

describe Robot do
  subject(:robot) { Robot.new }

  let(:shields) { Batteries.new }

  describe "#pick_up" do
    it "should automatically charge shields if shields depleted" do
      robot.shields = 0
      shields.should_receive(:charge).and_call_original
      robot.pick_up(shields)
      robot.shields.should eq(50)
    end
    it "should not auto charge if shields not depleted" do
      robot.shields = 1
      shields.should_not_receive(:charge)
      robot.pick_up(shields)
      robot.shields.should eq(1)
    end
  end

end
