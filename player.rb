require_relative 'treasure_trove'
require_relative 'playable'

class Player
  include Playable

  attr_accessor :name
  attr_accessor :health

  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def name=(name)
    @name = name.capitalize
  end

  def to_s
    "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
  end

  def skip
    puts "\n#{@name} was skipped."
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points

    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
  end

  def each_found_treasure
    @found_treasures.each do | name, points |
      treasure = Treasure.new(name, points)

      yield(treasure)
    end
  end

  def score
    @health + points
  end

  def points
    @found_treasures.values.reduce(0, :+)
  end
end

if __FILE__ == $0
  player = Player.new("moe")
  puts player.name
  puts player.health

  player.w00t
  puts player.health

  player.blam
  puts player.health
end
