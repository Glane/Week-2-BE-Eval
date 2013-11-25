module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Records a win for a ball in a game.
    #
    # winner - The Integer (1 or 2) representing the winning player.
    #
    # Returns the score of the winning player. 
    def wins_ball(winner)
      # TODO: Think it's gross to pass an integer instead of a player object?
      # Then reimplement this method!
      if winner == 1
        @player1.points = @player1.points + 1
      elsif winner == 2
        @player2.points = @player2.points + 1
      end
    end 

    def game_score
      if (@player1.points == @player2.points) && (@player2.points > 2)
        return "duece"
      
      elsif (@player1.points == @player2.points + 1) && (@player1.points >3)
        return "advantage player 1"      

      elsif (@player2.points == @player1.points + 1) && (@player2.points >3)
        return "advantage player 2"

      elsif (@player1.points == @player2.points + 2) && (@player1.points >3)
        return "player 1 wins !"      

      elsif (@player2.points == @player1.points + 2) && (@player2.points >3)
        return "player 2 wins !"

      else 
        return "the score is #{@player1.score} to #{@player2.score}"
      end  
    end
  end 

    
  


  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
      @opponent = nil
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    def score
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      return 'fourty' if (@points == 3)
    end
  end
end

