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

  def play(rounds)
    puts "There are #{@players.size} players in #{@title}:"

    @players.each do |player|
      puts player
    end

    puts "\n\n"

    1.upto(rounds) do |round|
      puts "Round #{round}"

      @players.each do |player|
        GameTurn.take_turn(player)

        puts "#{player}\n\n"
      end
    end
  end

  def print_stats
    strong, wimpy = @players.partition { |player| player.strong? }

    puts "\n#{@title} Statistics:"

    puts "\n#{strong.size} strong players:"
    strong.each do |player|
      puts "#{player.name} (#{player.health})"
    end

    puts "\n#{wimpy.size} wimpy players:"
    wimpy.each do |player|
      puts "#{player.name} (#{player.health})"
    end
  end
end
