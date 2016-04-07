require 'sinatra'
require_relative 'lib/scoring.rb'

class Scrabble_ap < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/score' do
    erb :score
  end

  post '/score' do
    @word_to_score = params["word"]
    erb :score
  end

  get '/score-many' do
    erb :score_many
  end

  post '/score-many' do
    @words_to_score = params["words"].split
    erb :score_many
  end

  run!
end
