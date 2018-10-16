require "hangman"

RSpec.describe "game state class tests" do


  it "game state updates" do
    word = Word.new("ruby")
    life_man = LifeManager.new(3)
    game_state = GameState.new(life_man,word, GuessHandler.new(life_man,word))

    expect(game_state.finished).to eq(false)
  end

  it "game state updates" do
    word = Word.new("ruby")
    life_man = LifeManager.new(3)
    guess_handler = GuessHandler.new(life_man,word)
    game_state = GameState.new(life_man,word, guess_handler)

    guess_handler.guess("r")
    guess_handler.guess("u")
    guess_handler.guess("b")
    guess_handler.guess("y")

    game_state.update

    expect(game_state.finished).to eq(true)
  end

  it "game state updates with game method" do
    game = Game.new("ruby")

    expect(game.game_state.finished).to eq(false)
  end

  it "game state updates with game method" do
    game = Game.new("ruby")
    game.guess('r')
    game.guess('u')
    game.guess('b')
    game.guess('y')

    expect(game.game_state.finished).to eq(true)
  end
end
