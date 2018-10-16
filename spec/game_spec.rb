require "hangman"

RSpec.describe "play hangman like a boss" do

  before :each do
    @game = Game.new("ruby")
  end

  it "shows hangman to be a hangman instance" do
    expect(@game.display_word).to eq("_ _ _ _")
  end

  it "shows display_word updates with correct guesses" do
    @game.guess("b")
    expect(@game.display_word).to eq("_ _ b _")
  end

  it "shows that a game updates lives after incorrect guess." do
    @game.guess("z")
    expect(@game.life_manager.lives_used).to eq(1)
  end

  it "shows that a game updates lives after incorrect guess." do
    @game.guess("z")
    @game.guess("g")
    expect(@game.life_manager.lives_used).to eq(2)
  end

  it "shows that a game updates lives after incorrect guess." do
    @game.guess("z")
    @game.guess("r")
    expect(@game.life_manager.lives_used).to eq(1)
  end

  it "shows that a game updates lives after incorrect guess." do
    @game.guess("z")
    @game.guess("z")
    expect(@game.life_manager.lives_used).to eq(1)
  end

  it "ends game when max lives have been used" do
    @game.guess("z")
    @game.guess("x")
    @game.guess("v")
    expect(@game.game_state.finished).to eq(true)
  end

  it "ends game when all letters have been correctly guessed" do
    @game.guess("r")
    @game.guess("u")
    @game.guess("b")
    @game.guess("y")
    expect(@game.game_state.finished).to eq(true)
  end


end
