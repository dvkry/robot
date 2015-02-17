require './spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe "#list" do
    it "should have a method to return the tally of all robots instantiated" do
      test_list = @robot.list
      5.times { Robot.new }      
      expect(@robot.list).to eq(test_list + 5)
    end
  end

  describe "#in_positions" do
    it "should return all robots at position x, y" do
      10.times { @robot.move_left }
      expect( Robot.in_positions(-10, 0) ).to eql([@robot])
    end
    it "should return all robots at position x, y" do
      new_robot = Robot.new
      other_new_robot = Robot.new
      10.times { new_robot.move_right }
      10.times { other_new_robot.move_right }
      expect( Robot.in_positions(10, 0) ).to eql([new_robot, other_new_robot])
    end
  end
end