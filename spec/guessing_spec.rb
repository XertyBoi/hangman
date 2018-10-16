require "hangman"

RSpec.describe "guess handler class tests" do


  it "guess handler tests if guesses are counted" do
    guess_handler = GuessHandler.new(LifeManager.new(3),Word.new("ruby"))
    guess_handler.guess("r")

    expect(guess_handler.correct_guesses.include? "r").to eq(true)
  end

  it "guess handler tests if incorrect guesses are counted" do
    guess_handler = GuessHandler.new(LifeManager.new(3),Word.new("ruby"))
    guess_handler.guess("z")

    expect(guess_handler.incorrect_guesses.include? "z").to eq(true)
  end

  it "guess handler tests if incorrect guesses are counted only in correct array" do
    guess_handler = GuessHandler.new(LifeManager.new(3),Word.new("ruby"))
    guess_handler.guess("z")

    expect(guess_handler.correct_guesses.include? "z").to eq(false)
  end
end
