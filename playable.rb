module Playable
  def blam
    @health -= 10
    puts "\n#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "\n#{@name} got w00ted!"
  end

  def strong?
    @health > 100
  end
end
