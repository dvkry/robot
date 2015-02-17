require './spec_helper'

# Introduce the concept of a ranged weapon: Grenades!
# Weapons now generally have a default range of 1 but grenades have a range of 2

describe Grenade do
  subject(:grenade) { Grenade.new }

  it { should be_an(Weapon) }

  its(:name) { should eq("Grenade") }
  its(:weight) { should eq(40) }
  its(:damage) { should eq(15) }
  its(:range) { should eq(2) }
end

describe Laser do
  subject(:laser) { Laser.new }

  its(:range) { should eq(1) }
end
