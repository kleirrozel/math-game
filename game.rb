class Game
  attr_accessor :current_player, :game_over

  def initialize
    @game_over = false
    @players = []
    @players[0] = Player.new("Player 1")
    @players[1] = Player.new("Player 2")
    @turn = 0
  end

  def start_game
    while !game_over do 
      player = @players[@turn % 2]
      other_player = @players[(@turn + 1) % 2]
      new_question = Question.new(player.name)
      new_question.ask_question
      answer = gets.chomp.to_i

      if new_question.validate(answer)
        puts "YES! You are correct."
      else
        player.lose_life
        puts "Seriously? No!"

        if player.life == 0
          puts "#{other_player.name} wins with a score of #{other_player.life}/3"
          @game_over = true
          puts "----- GAME OVER -----"
          puts "Good bye!"
          break
        end
       
      end
    
    puts "P1: #{@players[0].life}/3 vs P2: #{@players[1].life}/3"  
    @turn = @turn + 1
    puts "----- NEW TURN -----"

    end
  end

end