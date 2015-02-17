require './spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe "#heal!" do
    it "Should raise an error when health is 0" do
      @robot.health = 0
      expect { @robot.heal!(10) }.to raise_error
    end
    it "Should heal if health is greater than 0" do
      @robot.health = 50
      @robot.heal!(10)
      expect(@robot.health).to eq(60)
    end
    it "should not heal is health is alread at maximum" do
      @robot.heal!(10)
      expect(@robot.health).to eq(100)
    end
  end

  describe "#attack!" do
    it "Should raise an error when the item being attacked is not a robot" do
      item = BoxOfBolts.new
      expect { @robot.attack!(item) }.to raise_error
    end
    it "Should attack another robot" do
      new_robot = Robot.new
      expect { @robot.attack!(new_robot) }.not_to  raise_error
    end
    it "Should damage another robot" do
      new_robot = Robot.new
      @robot.attack(new_robot)
      expect(new_robot.shields).to eq(45) # 5 pts of damage
    end
  end
end