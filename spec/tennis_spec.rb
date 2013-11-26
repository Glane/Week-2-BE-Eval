require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'pry'

require_relative '../tennis'

describe Tennis::Game do
  let(:game) { Tennis::Game.new }

  describe '.initialize' do
    it 'creates two players' do
      expect(game.player1).to be_a(Tennis::Player)
      expect(game.player2).to be_a(Tennis::Player)
    end
    it 'sets the opponent for each player' do
    end
  end
    

  describe '#wins_ball' do
    it 'increments the points of the winning player' do
      game.wins_ball(1)

      expect(game.player1.points).to eq(1)
    end
  end
 
  describe '#game_score' do 
    context 'when score is tied above 2' do
      it 'returns duece' do
        game.player1.points = 4
        game.player2.points = 4
        expect(game.game_score).to eq ("duece")
      end
    end

    context 'when score is advantage player1' do
      it 'returns advantage player 1' do
        game.player1.points = 4
        game.player2.points = 3
        expect(game.game_score).to eq ("advantage player 1")
      end
    end

    context 'when score is advantage player2' do
      it 'returns advantage player 2' do
        game.player1.points = 4
        game.player2.points = 5
        expect(game.game_score).to eq ("advantage player 2")
      end
    end

    context 'when score is above 3 and player 1 wins by 2' do
      it 'returns player 1 wins !' do
        game.player1.points = 4
        game.player2.points = 2
        expect(game.game_score).to eq ("player 1 wins !")
      end
    end


    context 'when score is above 3 and player 2 wins by 2' do
      it 'returns player 2 wins !' do
        game.player1.points = 3
        game.player2.points = 5
        expect(game.game_score).to eq ("player 2 wins !")
      end
    end

    context 'when score has not yet reached duece or win' do
      it 'the score is #{@player1.score"} to #{@player2.score}' do
        game.player1.points = 0
        game.player2.points = 2 
        expect(game.game_score).to eq ("the score is love to thirty")
      end
    end
  end
end


describe Tennis::Player do
  let(:player) do
    player = Tennis::Player.new
    player.opponent = Tennis::Player.new
    return player
  end


  describe '.initialize' do
    it 'sets the points to 0' do
      expect(player.points).to eq(0)
    end 
  end

  describe '#record_won_ball!' do
    it 'increments the points' do
      player.record_won_ball!
      expect(player.points).to eq(1)
    end
  end

  describe '#score' do
    context 'when points is 0' do
      it 'returns love' do
        expect(player.score).to eq('love')
      end
    end

    context 'when points is 1' do
      it 'returns fifteen' do
        player.points = 1
        expect(player.score).to eq('fifteen')
      end 
    end
    
    context 'when points is 2' do
      it 'returns thirty' do
        player.points = 2
        expect(player.score).to eq('thirty')
      end 
    end
    
    context 'when points is 3 and opponent points is < 3' do
      it 'returns forty' do
        player.points = 3
        expect(player.score).to eq('fourty')
      end
    end
  end
end