require './spec_helper'

# The robot should now be smart enough that if it picks up health and needs
# to consume it, then it will automatically feed on the bolts.
# It should only feed on the bolts if it needs all of the energy from them

describe Robot do
  subject(:robot) { Robot.new }

  let(:health) { BoxOfBolts.new }

  describe "#pick_up" do
    it "should automatically feed box of bolts if at or below 80hp" do
      robot.health = 80
      health.should_receive(:feed).and_call_original
      robot.pick_up(health)
      robot.health.should eq(100)
    end
    it "should not auto feed box of bolts if above 80hp" do
      robot.health = 81
      health.should_not_receive(:feed)
      robot.pick_up(health)
      robot.health.should eq(81)
    end
  end

end
