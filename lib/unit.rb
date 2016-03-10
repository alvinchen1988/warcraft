class Unit

  attr_accessor :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(enemy)
    return false if enemy.dead? || self.dead?
    enemy.damage(self.attack_power)
  end

  def damage(attack_power)
    self.health_points -= attack_power
  end

  def dead?
    health_points <= 0
  end

end