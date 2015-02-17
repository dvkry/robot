class Batteries < Item

  def initialize
    super("Batteries", 25)
  end

  def charge(robot)
    robot.charge
  end

end