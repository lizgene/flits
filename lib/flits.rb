class Flits
  def self.new(args)
    front = args[0]
    back = args[1]

    File.open('data.txt', 'a') do |file|
      file.puts "#{front}, #{back}"
      puts "Translation added."
    end
  end

  def self.list
    File.open('data.txt', 'r') do |file|
      file.readlines.each do |line|
        front,back = line.chomp.split(/,/)
        printf("%s : %s\n", front, back)
      end
    end
  end

  def self.study
    File.open('data.txt', 'r') do |file|
      file.readlines.each do |line|
        flash(line)
      end
    end
  end

  def self.flash(card)
    front,back = card.chomp.split(/,/)

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
