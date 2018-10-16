require 'graphics'

class Game
  attr_reader :life_manager, :game_state

  def initialize(word)
    @word_holder = Word.new(word)
    @life_manager = LifeManager.new(9)
    @guess_handler = GuessHandler.new(@life_manager,@word_holder)
    @game_state = GameState.new(@life_manager ,@word_holder,@guess_handler)
    @output_handler = OutputHandler.new
  end

  def display_word
    @word_holder.display_word(@guess_handler.correct_guesses)
  end

  def guess(char)
    @guess_handler.guess(char)
    @game_state.update
    @output_handler.output(display_word, @life_manager.lives_used, @guess_handler.incorrect_guesses)
  end
end

class OutputHandler

  def initialize
    @drawer = Drawer.new
  end

  def output(display_word, lives, incorrect_guesses)

    #drawer - draw display word
    #drawer - draw hangman/lives
    #drawer - draw letters used
    #puts "\e[H\e[2J"
    puts "\n\n"
    @drawer.draw_display_word(display_word)
    @drawer.draw_hangman(lives)
    @drawer.draw_word_bin(incorrect_guesses)
  end

end

class LifeManager

  attr_reader :lives_used, :lives_max

  def initialize(max)
    @lives_used = 0
    @lives_max = max
  end

  def add_used_life
    @lives_used += 1
  end
end

class GameState

  attr_reader :finished

  def initialize(life_man, word,guess_handler)
    @finished = false
    @word_holder = word
    @guess_handler = guess_handler
    @life_man = life_man
  end

  def update
    if (@life_man.lives_used == @life_man.lives_max)
      @finished = true
    elsif @word_holder.word.chars.join(' ') == @word_holder.display_word(@guess_handler.correct_guesses)
      @finished = true
    else
      @finished = false
    end
  end

end

class GuessHandler

  attr_reader :correct_guesses, :incorrect_guesses

  def initialize(life_man, word)
    @word_holder = word
    @life_man = life_man
    @correct_guesses = []
    @incorrect_guesses = []
  end

  def guess(char)
    if !@incorrect_guesses.include?(char) && !@correct_guesses.include?(char)
      if @word_holder.include?(char)
       @correct_guesses << char
      else
        @incorrect_guesses << char
        @life_man.add_used_life
      end
    end
  end
end

class Word

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def display_word(correct_guesses)
    word.downcase.chars.map { |char|
      correct_guesses.include?(char) ? char : "_"
    }.join(' ')
  end

  def include?(char)
    word.include? char
  end
end
