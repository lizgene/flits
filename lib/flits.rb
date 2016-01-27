class Flits
  require 'csv'

  def initialize(filename)
    @flashcards = CSV.read(filename)
  end

  def study
    @flashcards.each do |card|
      flash(card)
    end
  end

  def flash(card)
    front = card.first
    back = card.last

    puts blue("Please translate: '#{front}'")
    puts "Your guess:"    

    guess = STDIN.gets.chomp
    
    if guess == back
      puts green("You're right!")
    else
      puts red("Nope, keep studying!")
      puts blue("Would you like to see the translation? [y/n]")
      answer = STDIN.gets.chomp
      puts green("#{back}") if answer == "y"
    end  
  end

  def red(text)
    colorize(text, 31)
  end

  def green(text)
    colorize(text, 32)
  end

  def blue(text)
    colorize(text, 36)
  end

  def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
  end
end
