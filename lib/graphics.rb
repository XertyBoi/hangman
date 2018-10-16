class Drawer

  def draw_word_bin(incorrect_guesses)
    puts "Used letters: #{incorrect_guesses.join(", ")}\n"
  end

  def draw_hangman(lives)
    case lives
    when 0
      puts <<~HANGMAN






      HANGMAN
    when 1
      puts <<~HANGMAN





       _________

      HANGMAN
    when 2
      puts <<~HANGMAN

      |
      |
      |
      |
      |_________

      HANGMAN
    when 3
      puts <<~HANGMAN
       _________
      |/       |
      |
      |
      |
      |_________

      HANGMAN
    when 4
      puts <<~HANGMAN
       _________
      |/       |
      |       (_)
      |
      |
      |_________

      HANGMAN
    when 5
      puts <<~HANGMAN
       _________
      |/       |
      |       (_)
      |        |
      |
      |_________

      HANGMAN
    when 6
      puts <<~HANGMAN
       _________
      |/       |
      |       (_)
      |        |
      |       |
      |_________

      HANGMAN
    when 7
      puts <<~HANGMAN
       _________
      |/       |
      |       (_)
      |        |
      |       | |
      |_________

      HANGMAN
    when 8
      puts <<~HANGMAN
       _________
      |/       |
      |       (_)
      |       -|
      |       | |
      |_________

      HANGMAN
    when 9
      puts <<~HANGMAN
       _________
      |/       |
      |       (_)
      |       -|-
      |       | |
      |_________

      HANGMAN
    else
      puts <<~HANGMAN
       _________
      |/       |
      |       (_)
      |       -|-
      |       | |
      |_________

      HANGMAN
    end
  end

  def draw_display_word(display)
    puts "#{display}\n"
  end

end
