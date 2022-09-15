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

  def load_players(filename = "players.csv")
    players = []

    File.readlines(filename).each do |line|
      name, health = line.split(",")
      player = Player.new(name, Integer(health))
      add_player(player)
    end
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
      if block_given?
        break if yield
      end

      puts "\nRound #{round}"

      @players.each do |player|
        GameTurn.take_turn(player)
      end
    end
  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def total_points
    @players.reduce(0) { |sum, player| sum + player.points }
  end

  def high_score_entry(player)
    "#{player.name.ljust(20, '.')} #{player.score}"
  end

  def save_high_scores(filename = "high_scores.txt")
    File.open(filename, "w") do |file|
      file.puts "#{@title} High Scores:"

      sorted_players = @players.sort { |a, b| b.score <=> a.score }
        sorted_players.each do |player|
        file.puts high_score_entry(player)
      end
    end
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

    puts "\n#{total_points} total points from treasures found."

    @players.each do |player|
      puts "\n#{player.name}'s treasure point totals:"

      player.each_found_treasure do | treasure |
        puts "#{treasure.points} total #{treasure.name} points."
      end

      puts "#{player.points} total treasure points."
    end

    puts "\n#{@title} High Scores:"
    sorted_players = @players.sort { |a, b| b.score <=> a.score }
    sorted_players.each do |player|
      puts high_score_entry(player)
    end
  end
end
