class Robot

  attr_accessor :position
  attr_accessor :items
  attr_accessor :health
  attr_accessor :equipped_weapon
  attr_accessor :shields
  @@robot_list = []

  def initialize
    @position = [0, 0]
    @items = []
    @health = 100
    @shields = 50
    @@robot_list << self
  end

  def list
    @@robot_list.length
  end

  def self.in_positions(x, y)
    robot_list = nil
    robot_list = @@robot_list.select { |robot| robot.position == [x, y] }
    robot_list
  end

  def self.scan(position)
    found_robots = Robot.in_positions(position[0], position[1])

    found_robots << in_positions(position[0] + 1, position[1])
    found_robots << in_positions(position[0] - 1, position[1])
    found_robots << in_positions(position[0], position[1] + 1)
    found_robots << in_positions(position[0], position[1] - 1)
    found_robots
  end

  def pick_up(item)
    return false if item.weight + items_weight > 250
    @items << item
    @equipped_weapon = item if item.is_a?(Weapon)
    item.feed(self) if (item.is_a? BoxOfBolts) && (@health <= 80)
    item.charge(self) if (item.is_a? Batteries) && (@shields == 0)
    true
  end

  def wound(amount)
    @shields -= amount
    if @shields < 0
      @health += @shields
      @shields = 0
    end
    @health = 0 if @health < 0
  end

  def heal(amount)
    @health += amount
    @health = 100 if @health > 100
  end

  def heal!(heal_points)
    raise "Already Dead!" if @health == 0
    heal(heal_points)
  end

  def charge
    @shields = 50
  end

  def attack(robot)
    if @equipped_weapon
      return false unless is_in_range?(robot, @equipped_weapon.range)
      @equipped_weapon.hit(robot)
      if @equipped_weapon.is_a? Grenade
        @equipped_weapon = nil        
        # index_in_items = @items.find_index { |item| item.is_a? Grenade }
        # @items.delete_at(index_in_items)
      end
    else
      return false unless is_adjacent?(robot)
      robot.wound(5)
    end
  end

  def attack!(robot)
    raise RobotAlreadyDead.new unless robot.is_a? Robot
    attack(robot)
  end

  def is_adjacent?(robot)
    true if (robot.position[0] - @position[0]).abs <= 1 && (robot.position[1] - @position[1]).abs <= 1
  end

  def is_in_range?(robot, range = 1)
    true if (robot.position[0] - @position[0]).abs <= range && (robot.position[1] - @position[1]).abs <= range
  end

  def items_weight
    @items.inject(0) {|sum, i| sum += i.weight }
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

end
