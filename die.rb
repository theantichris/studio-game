class Die
  attr_reader :number

  def initialize
    roll
  end

  def roll
    @nubmer = rand(1..6)
  end
end
