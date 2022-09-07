require_relative 'player'
require_relative 'die'

class Game
  attr_reader :title
  attr_reader :players

  def initialize(title)
    @title = title.capitalize
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    puts "There are #{@players.size} in #{@title}:"

    @players.each do |player|
      puts player
    end

    puts "\n\n"

    @players.each do |player|
      die = Die.new
      number_rolled = die.roll

      case number_rolled
      when 1..2
        player.blam
      when 3..4
        puts "#{player.name} was skipped."
      else
        player.w00t
      end

      puts "#{player}\n\n"
    end
  end
end
