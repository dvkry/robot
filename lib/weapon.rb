class Weapon < Item

  attr_accessor :damage, :range

  def initialize(name, weight, damage, range = 1)
    @damage = damage
    @range = range
    super(name, weight)
  end

  def hit(robot)
    robot.wound(45)
  end
end