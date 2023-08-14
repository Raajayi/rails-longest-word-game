require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    choices_size = 10
    letter_choices = ('a'..'z').to_a
    # @letters = letter_choices.sample(10)
    @letters = choices_size.times.map { letter_choices.sample }
  end

  def score
    @guess = params[:guess]
    @grid = params[:choices_array]

    attempt_array = @guess.chars
    bool_array = attempt_array.map { |char| @grid.include?(char) }
    # attempt_hash = attempt_array.group_by { |char| char }.to_h { |key, value| [key, value.length] }
    # grid_hash = grid.group_by { |char| char }.to_h { |key, value| [key, value.length] }

    if bool_array.all? == false
      @score_message = "Sorry but #{@guess} can't be built out of #{@grid}"
    end

  end
end
