def random_card
  cards = ["two", "three", "four", "five", "six", "seven",
           "eight", "nine", "ten",
           "jack", "queen", "king", "ace"]

  cards.sample
end

def score(hand)
  score = 0
  scores = {
    "two" => 2,
    "three" => 3,
    "four" => 4,
    "five" => 5,
    "six" => 6,
    "seven" => 7,
    "eight" => 8,
    "nine" => 9,
    "ten" => 10,
    "jack" => 10,
    "queen" => 10,
    "king" => 10,
    "ace" => 11
  }

  hand.each do |card|
    score += scores[card]
  end

  score
end

def move
  while true do
    puts "Would you like to hit or stick"
    answer = gets.chomp
    if answer == "hit"
      return "hit"
    elsif answer == "stick"
      return "stick"
    else
    end
  end
end

def run_game
  hand = []
  2.times { hand.push(random_card) }
  puts "You receive two cards -> #{hand[0]} and #{hand[1]}"
  puts "Score so far: " + score(hand).to_s
  while true
    answer = move
    if answer == "hit"
      hand.push(random_card)
      puts "You receive a " + hand[(hand.length - 1)]
      break if score(hand) >= 21
      puts "Score so far: " + score(hand).to_s
    elsif answer == "stick"
      break
    else
    end
  end
  if score(hand) <= 21
    puts "You scored: " + score(hand).to_s
  else
    puts "You busted with: " + score(hand).to_s
  end
end

run_game
