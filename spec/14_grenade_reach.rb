require './spec_helper'

# Since grenades have a range of 2, if the robot has one equipped,
# it can attack an enemy robot that is 2 tiles away instead of just 1 tile away
# That said, it will also discard/unequip the grenade

describe Robot do
  subject(:robot) { Robot.new }
  let(:grenade)   { Grenade.new }

  describe '#attack' do

    context "equipped with grenade" do

      before do
        robot.equipped_weapon = grenade
      end

      context "with enemy robot two blocks above" do

        let(:robot2) do
          r = Robot.new
          r.move_up
          r.move_up
          r
        end

        it "is able to successfully wound the enemy" do
          robot2.should_receive(:wound)
          robot.attack(robot2)
        end

        it "should dispense the weapon (can only use once)" do
          robot.attack(robot2)
          robot.equipped_weapon.should be_nil
        end

      end

      context "with enemy robot three blocks above" do

        let(:robot2) do
          r = Robot.new
          r.move_up
          r.move_up
          r.move_up
          r
        end

        it "is NOT able to successfully wound the enemy" do
          robot2.should_not_receive(:wound)
          robot.attack(robot2)
        end

      end
    end
  end
end
