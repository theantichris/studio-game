require_relative 'die'
require_relative 'player'
require_relative 'treasure_trove'

module StudioGame
  module GameTurn
    def self.take_turn(player)
      die = Die.new
      number_rolled = die.roll

      case number_rolled
      when 1..2
        player.blam
      when 3..4
        player.skip
      else
        player.w00t
      end

      treasure = TreasureTrove.random
      player.found_treasure(treasure)
    end
  end
end
