require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @letters = params[:letters].split(" ")
    @word = params[:word].upcase

    if valid_word?(@word,@letters) && english_word?(@word)
      @message = "Congratulations! #{@word} is a valid English word!"
      @score = @word.length

    elsif !valid_word?(@word, @letters)
      @message = "Sorry, but #{@word} can't be built out of #{@letters.join(", ")}"
      @score = 0

    else
      @message = "Sorry, but #{@word} does not seem to be a valid English word."
      @score = 0
    end
  end

  private

  def valid_word?(word,letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def english_word?(word)
    url = "https://dictionary.lewagon.com/#{word}"
    response = URI.open(url).read
    json = JSON.parse(response)
    json["found"]
  end
end
