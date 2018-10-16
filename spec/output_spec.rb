require "hangman"

RSpec.describe "play hangman like a boss" do

  before :each do
    @game = Game.new("ruby")
  end

  it "testing drawing output by visual" do
    @game.guess('q')
    @game.guess('a')
    @game.guess('s')
    @game.guess('e')
    @game.guess('x')
    @game.guess('c')
    @game.guess('l')
    @game.guess('p')
    @game.guess('t')

    expect(@game.display_word).to eq("_ _ _ _")
  end
end
