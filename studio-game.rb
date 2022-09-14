require_relative 'game'

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase

  case answer
  when /^\d+$/
    knuckleheads.play(Integer(answer)) do
      knuckleheads.total_points >= 100000
    end
  when "quit", "exit"
    knuckleheads.print_stats
    break
  else
    puts "Please enter a number or 'quit'."
  end
end
