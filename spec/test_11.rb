require_relative 'spec_helper'

describe Barracks do 

  before :each do 
    @barrack = Barracks.new
  end

  describe "#initialize" do
    it "should have a health points of 500 once instantiated" do
      expect(@barrack.health_points).to eq(500)
    end

    it "should have 500 of lumber once instantiated" do
      expect(@barrack.lumber).to eq(500)
    end

  end


  describe "#damage" do

    it "should have its health_points lowered by the attack_power of the unit" do
      @unit = Unit.new(50, 15)
      @unit.attack!(@barrack)
      # @barrack.damage(@unit.attack_power)
      expect(@barrack.health_points).to eq(485)
    end
  end
end

describe Footman do

  before :each do 
    @barracks = Barracks.new
    @footman = Footman.new
  end

  describe "#attack!" do
    it "should only do 1/2 damage if attacking a barrack" do
      expect(@barracks).to receive(:damage).with(5)
      @footman.attack!(@barracks)
    end

  end

end

describe Unit do

  before :each do
     @unit = Unit.new(20,2)
     @enemy_unit = Unit.new(40,5)
  end

  describe "#dead?" do
    it "should return true if unit health_points drop to 0" do
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.dead?).to be true
    end
  end

  describe "#attack!" do
    it "should not attack enemy if enemy HP = 0 " do
      expect(@enemy_unit).to receive(:health_points).and_return(0)
      expect(@unit.attack!(@enemy_unit)).to be false
    end

    it "should not be able to attack if its HP = 0" do
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.attack!(@enemy_unit)).to be false
    end

  end
end

describe SeigeEngine do

  describe ".new" do

    before :each do
      @siege_engine = SeigeEngine.new
    end

    it "starts off with 50 attack power" do
      expect(@siege_engine.attack_power).to eq(50)
    end

    it "starts off with 400 health_points" do
      expect(@siege_engine.health_points).to eq(400)
    end

    it "starts off with 200 gold" do 
      expect(@siege_engine.gold).to eq(200)
    end

    it "starts off with 60 lumber" do
      expect(@siege_engine.lumber).to eq(60)
    end

    it "starts off with 3 food resources" do
      expect(@siege_engine.food).to eq(3)
    end

  end

  describe "#attack" do

    before :each do
      @siege_engine = SeigeEngine.new
    end

    it "should deal 2x damage to Barracks" do
      barrack = Barracks.new
      expect(barrack).to receive(:damage).with(@siege_engine.attack_power*2)
      @siege_engine.attack!(barrack)
    end

    it "should deal damage to SiegeEngine type of unit" do
      siege_engine_unit = SeigeEngine.new
      expect(siege_engine_unit).to receive(:damage).with(@siege_engine.attack_power)
      @siege_engine.attack!(siege_engine_unit)
    end

    it "should deal 0 damage to other units except its own type and Barracks" do
      peasant = Peasant.new
      expect(peasant).to receive(:damage).with(0)
      @siege_engine.attack!(peasant)
      footman = Footman.new
      expect(footman).to receive(:damage).with(0)
      @siege_engine.attack!(footman)
      general_unit = Unit.new(20,2)
      expect(general_unit).to receive(:damage).with(0)
      @siege_engine.attack!(general_unit)
    end




  end



end