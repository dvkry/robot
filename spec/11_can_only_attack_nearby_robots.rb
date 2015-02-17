require './spec_helper'

# Robots can only attack enemy robots that are in the tile/block next to them
# So if an enemy robot is directly above, below, or next to the robot, then it will wound the enemey robot
# Otherwise the attack method should not do anything

describe Robot do
  subject(:robot) { Robot.new }

  describe '#attack' do
    context "with enemy robot directly above" do
      let(:robot2) do
        r = Robot.new
        r.move_up # not 0,0 so move up by one
        r
      end
      it "is able to successfully wound the enemy" do
        robot2.should_receive(:wound)
        robot.attack(robot2)
      end
    end

    context "with enemy robot two blocks above" do
      let(:robot2) do
        r = Robot.new
        r.move_up
        r.move_up # a second time
        r
      end
      it "is unable to successfully wound the enemy" do
        robot2.should_not_receive(:wound)
        robot.attack(robot2)
      end
    end

    context "with enemy robot one block below" do
      let(:robot2) do
        r = Robot.new
        r.move_down
        r
      end
      it "is able to successfully wound the enemy" do
        robot2.should_receive(:wound)
        robot.attack(robot2)
      end
    end

    context "with enemy robot two blocks below" do
      let(:robot2) do
        r = Robot.new
        r.move_down
        r.move_down
        r
      end
      it "is unable to successfully wound the enemy" do
        robot2.should_not_receive(:wound)
        robot.attack(robot2)
      end
    end

  end
end
