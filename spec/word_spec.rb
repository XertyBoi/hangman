require "hangman"

RSpec.describe "word class tests" do


  it "word class to show display_word" do
    word = Word.new("Ruby")
    expect(word.display_word [""]).to eq("_ _ _ _")
  end

  it "word class to show updated display_word" do
    word = Word.new("Ruby")
    expect(word.display_word ["r"]).to eq("r _ _ _")
  end

  it "word class to show updated display_word" do
    word = Word.new("Ruby")
    expect(word.display_word ["r","b"]).to eq("r _ b _")
  end
end
