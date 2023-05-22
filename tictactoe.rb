
print "Please enter player 1's name: "
$player1 = gets.chomp 

until !$player1.empty?
    print "Try again. Please enter player 1's name: "
    $player1 = gets.chomp
end

puts "Thanks \n\n\n"

print "Please enter player 2's name: "
$player2 = gets.chomp 

until !$player2.empty?
    print "Try again. Please enter player 2's name: "
    $player2 = gets.chomp
end

puts "Thanks \n\n\n"

$squares = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
$remaining_indexes = ["1","2","3","4","5","6","7","8","9"]
$player1_chosen_indexes = []
$player2_chosen_indexes = []
$remaining_squares = ['1) Top Left','2) Top Middle','3) Top Right','4) Middle Left','5) Middle Middle','6) Middle Right','7) Bottom Left','8) Bottom Middle','9) Bottom Right']
$winning_combos = [["1","2","3"], ["4","5","6"], ["7","8","9"], ["1","4","7"], ["2","5","8"], ["3","6","9"], ["1","5","9"], ["3","5","7"]]
$won = false


$mygrid = 
"
 #{$squares[0] ? $squares[0]:" "} | #{$squares[1] ? $squares[1]:" "} | #{$squares[2] ? $squares[2]:" "} 
---+---+---
 #{$squares[3] ? $squares[3]:" "} | #{$squares[4] ? $squares[4]:" "} | #{$squares[5] ? $squares[5]:" "} 
---+---+---
 #{$squares[6] ? $squares[6]:" "} | #{$squares[7] ? $squares[7]:" "} | #{$squares[8] ? $squares[8]:" "}  
"

puts $mygrid;
puts "\n"

def player1_turn
    puts $remaining_squares;
    puts "\n#{$player1}, make your choice:"
    player1_input = gets.chomp
    until $remaining_indexes.include?(player1_input)
        puts "Please enter a valid number between 1 and 9"
        player1_input = gets.chomp
    end

    $remaining_indexes.reject! { |i| i==player1_input}
    $remaining_squares.reject! { |i| i[0]==player1_input}
    $player1_chosen_indexes.push(player1_input)
    squares_index = player1_input.to_i - 1
    $squares[squares_index] = "X"
    $mygrid = 
    "
     #{$squares[0] ? $squares[0]:" "} | #{$squares[1] ? $squares[1]:" "} | #{$squares[2] ? $squares[2]:" "} 
    ---+---+---
     #{$squares[3] ? $squares[3]:" "} | #{$squares[4] ? $squares[4]:" "} | #{$squares[5] ? $squares[5]:" "} 
    ---+---+---
     #{$squares[6] ? $squares[6]:" "} | #{$squares[7] ? $squares[7]:" "} | #{$squares[8] ? $squares[8]:" "}  
    "
    puts "\n"
    puts $mygrid
end

def player2_turn
    puts $remaining_squares;
    puts "\n#{$player2}, make your choice:"
    player2_input = gets.chomp
    until $remaining_indexes.include?(player2_input)
        puts "Please enter a valid number between 1 and 9"
        player2_input = gets.chomp
    end

    $remaining_indexes.reject! { |i| i==player2_input}
    $remaining_squares.reject! { |i| i[0]==player2_input}
    $player2_chosen_indexes.push(player2_input)
    squares_index = player2_input.to_i - 1


    $squares[squares_index] = "O"
    $mygrid = 
    "
     #{$squares[0] ? $squares[0]:" "} | #{$squares[1] ? $squares[1]:" "} | #{$squares[2] ? $squares[2]:" "} 
    ---+---+---
     #{$squares[3] ? $squares[3]:" "} | #{$squares[4] ? $squares[4]:" "} | #{$squares[5] ? $squares[5]:" "} 
    ---+---+---
     #{$squares[6] ? $squares[6]:" "} | #{$squares[7] ? $squares[7]:" "} | #{$squares[8] ? $squares[8]:" "}  
    "
    puts "\n"
    puts $mygrid
end

def check_player1_winner
    $winning_combos.each do |winning_combo|
        score = 0
        winning_combo.each do |index|
            if $player1_chosen_indexes.include? index 
                score += 1
            end
        end
        if score == 3
            $won = true
            $winner = $player1
            return 
        end
    end
end

def check_player2_winner
    $winning_combos.each do |winning_combo|
        score = 0
        winning_combo.each do |index|
            if $player2_chosen_indexes.include? index 
                score += 1
            end
        end
        if score == 3
            $won = true
            $winner = $player2
            return
        end
    end
end


until $won
    player1_turn
    check_player1_winner
    if !$won 
        player2_turn
        check_player2_winner
    end
end

puts "WE HAVE A WINNER - #{$winner}"