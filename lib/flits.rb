class Flits
  require 'csv'

  def initialize
    @flashcards = CSV.read("../data/dutch.csv")
  end

  def study
    @flashcards.each do |card|
      flash(card)
    end
  end

  def flash(card)
    front = card.first
    back = card.last

    puts "Dutch: '#{front}'"
    puts "English: '#{back}'"

    # maybe use a regex to make this less sensitive instead of just 'downcase'
    # if answer.downcase == back.downcase
    #   puts "correct!"
    # else
    #   puts "nope, back in the pile!"
    # end
  end
end
