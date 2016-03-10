require_relative 'unit'
require_relative 'footman'
require_relative 'peasant'
require_relative 'seigeengine'
class Barracks

  attr_accessor :gold, :food
  attr_reader :health_points, :lumber

  def initialize
    @gold = 1000
    @food = 80
    @health_points = 500
    @lumber = 500
  end

  def train_footman
    if can_train_footman?
      self.gold -= 135
      self.food -= 2
      Footman.new
    else 
      nil
    end
  end

  def can_train_footman?
    gold >= 135 and food >=2
    # true
  end

  def train_peasant
    if can_train_peasant?
      self.gold -= 90
      self.food -= 5
      Peasant.new
    else
      nil
    end
  end

  def can_train_peasant?
    gold >=90 and food >=5
  end

  def damage(attack_power)
    @health_points -= attack_power
  end

  def dead?
    health_points <= 0
  end


end

# footman1 = Footman.new
# p footman1
# footman2 = Footman.new
# footman1.attack!(footman2)
# footman1.attack!(footman2)
# footman1.attack!(footman2)
# puts footman1.attack!(footman2)
# puts footman1.attack!(footman2)
# puts footman1.attack!(footman2)
# puts footman1.attack!(footman2)

seigeengine = SeigeEngine.new
seigeengine2 = SeigeEngine.new
barracks = Barracks.new
seigeengine.attack!(barracks)
p barracks
footman = Footman.new
seigeengine.attack!(footman)
seigeengine.attack!(footman)
seigeengine.attack!(seigeengine2)
p footman
p seigeengine2

# p 

