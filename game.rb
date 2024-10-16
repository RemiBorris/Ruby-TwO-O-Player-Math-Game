class Game
  attr_accessor :current_player

  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def game_over
    @player1.lives == 0 || @player2.lives == 0
  end

  def announce_winner
    if @player1.lives == 0
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3!"
    elsif @player2.lives == 0
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3!"
    end
  end

  def switch_player
    @current_player = current_player == @player1 ? @player2 : @player1
  end

  def start
    until game_over
      question = Question.new
      correct_answer = question.ask_question(@current_player.name)

      if question.correct?(correct_answer)
        puts "YES! You are correct."
      else
        puts "Seriously? No!"
        @current_player.lose_life
      end

      break if game_over
      
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"

      switch_player
    end

    announce_winner
  end
end
