require './spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe "#scan" do
    it "should return all the robots within range" do
      4.times { @robot.move_up }
      new_robot = Robot.new
      5.times { new_robot.move_up }
      another_new_robot = Robot.new
      6.times { another_new_robot.move_up }
      position = [0,5]
      expect(Robot.scan(position)).to eq([@robot, new_robot, another_new_robot])
    end
  end
end