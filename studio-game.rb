require_relative 'game'
require_relative 'clumsy_player'
require_relative 'berserk_player'

knuckleheads = Game.new("Knuckleheads")
knuckleheads.load_players

knuckleheads.add_player(ClumsyPlayer.new("klutz", 105))
knuckleheads.add_player(BerserkPlayer.new("berserker", 50))

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

knuckleheads.save_high_scores
