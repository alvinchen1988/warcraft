class SeigeEngine < Unit

  attr_accessor :gold, :food, :health_points, :lumber, :attack_power

  def initialize
    @food = 3
    @gold = 200
    @health_points = 400
    @lumber = 60
    @attack_power = 50
  end

  def attack!(enemy)
    enemy.damage(0) if enemy.is_a?(Unit) && !(enemy.is_a?(SeigeEngine))
    enemy.damage(self.attack_power) if enemy.is_a?(SeigeEngine)
    enemy.damage(self.attack_power*2) if enemy.is_a?(Barracks)
  end

end