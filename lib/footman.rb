# http://classic.battle.net/war3/human/units/footman.shtml
require_relative 'unit'

class Footman < Unit
  attr_accessor :health_points, :attack_power

  def initialize
    super(60, 10) # 60 is the health_points, 10 is the attack_power
  end

  def attack!(enemy)
    return false if enemy.dead? || self.dead?

    if enemy.is_a?(Barracks)
      enemy.damage(@attack_power * 0.5)
    else 
      enemy.damage(@attack_power)
    end
  end

end

