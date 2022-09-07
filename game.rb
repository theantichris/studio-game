require_relative 'player'
require_relative 'die'
require_relative 'game_turn'

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
      GameTurn.take_turn(player)

      puts "#{player}\n\n"
    end
  end
end
