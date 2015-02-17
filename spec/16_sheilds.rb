require './spec_helper'

describe Robot do

  before :each do
    @robot = Robot.new
  end

  it "should drain shield when attacked" do
    new_robot = Robot.new
    @robot.attack!(new_robot)
    expect(new_robot.shields).to be (45)
  end

  it "should not drain health if all the damage went to sheilds" do
    new_robot = Robot.new
    @robot.attack!(new_robot)
    expect(new_robot.health).to be (100)
  end

  it "should drain both health and sheild if sheilds are low" do
    new_robot = Robot.new
    new_robot.shields = 2
    @robot.attack!(new_robot)
    expect(new_robot.shields).to be(0)
    expect(new_robot.health).to be(97)
  end

end