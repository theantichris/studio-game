require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

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

    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points."
    end

    1.upto(rounds) do |round|
      puts "\nRound #{round}"

      @players.each do |player|
        GameTurn.take_turn(player)
      end
    end
  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def print_stats
    strong, wimpy = @players.partition { |player| player.strong? }

    puts "\n#{@title} Statistics:"

    puts "\n#{strong.size} strong players:"
    strong.each do |player|
      print_name_and_health(player)
    end

    puts "\n#{wimpy.size} wimpy players:"
    wimpy.each do |player|
      print_name_and_health(player)
    end

    puts "\n#{@title} High Scores:"
    sorted_players = @players.sort { |a, b| b.score <=> a.score }
    sorted_players.each do |player|
      puts "#{player.name.ljust(20, '.')} #{player.health}"
    end
  end
end
