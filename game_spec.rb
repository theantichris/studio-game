require_relative 'game'

describe Game do
  it "has a capitalized title" do
    game = Game.new("butts")

    game.title.should == "Butts"
  end

  it "adds a player" do
    game = Game.new("butts")
    player = Player.new("larry")

    game.add_player(player)

    game.players.should == [player]
  end
end
