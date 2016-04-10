class Scoring
  SCORE_CHART = {
    "a" => 1, "e" => 1, "i" => 1, "o" => 1, "u" => 1, "l" => 1, "n" => 1, "r" => 1, "s" => 1, "t" => 1,
    "d" => 2, "g" => 2,
    "b" => 3, "c" => 3, "m" => 3, "p" => 3,
    "f" => 4, "h" => 4, "v" => 4, "w" => 4, "y" => 4,
    "k" => 5,
    "j" => 8, "x" => 8,
    "q" => 10, "z" => 10
  }

  def self.check_if_letters(word)
    !word.match(/[^A-Za-z]/)
  end

  def self.letters_and_scores(word)
    word_breakdown = []
    letters = word.split(//)
    letters.each do |letter|
      single_score = Scoring.score(letter)
      word_breakdown << [letter, single_score]
    end
    return word_breakdown
  end

  def self.score(word)
    arr = word.downcase.split(//)
    arr.length == 7 ? tally = 50 : tally = 0
    arr.each do |i|
      value = SCORE_CHART[i]
      tally = value + tally
    end
    return tally
  end

  def self.highest_score_from(array_of_words)
    high_word = ""
    high_score = 0
    array_of_words.each do |word|
      current_scoring = self.score(word)
      if current_scoring > high_score
        high_word = word
        high_score = current_scoring
      elsif current_scoring == high_score
        if word.length < high_word.length && high_word.length != 7
          high_word = word
          high_score = current_scoring
        end
      end
    end
    return high_word
  end

  def self.shortest_high_value(array_of_words)
    high_word = ""
    high_score = 0
    array_of_words.each do |word|
      current_scoring = self.score(word)
      if current_scoring > high_score
        high_word = word
        high_score = current_scoring
      elsif current_scoring == high_score
        if word.length < high_word.length
          high_word = word
          high_score = current_scoring
        end
      end
    end
    return high_word
  end
end

# The above works, but is (obviously) repetative. I tried to correct this in a few ways, but ulimately couldn't make them work. I've included them because, though they are failures, I feel like they were close. I'm hoping for some feedback on where I went wrong.

# attempt one:
# def self.condition_one(word, high_word)
#   word.length < high_word.length && high_word.length != 7
# end
#
# def self.condition_two(word, high_word)
#   word.length < high_word.length
# end
#
# def self.highest_score_from(array_of_words, condition)
#   high_word = ""
#   high_score = 0
#   array_of_words.each do |word|
#     current_scoring = self.score(word)
#     if current_scoring > high_score
#       high_word = word
#       high_score = current_scoring
#     elsif current_scoring == high_score
#       if "conditionone"
#         Scoring.condition_one(word, high_word)
#         high_word = word
#         high_score = current_scoring
#       elsif "conditiontwo"
#         Scoring.condition_two(word, high_word)
#         high_word = word
#         high_score = current_scoring
#       end
#     end
#   end
#   return high_word
# end
# end
#
#

# Attempt 2: 
# def self.highest_score_from(array_of_words, condition)
# high_word = ""
# high_score = 0
# array_of_words.each do |word|
#   current_scoring = self.score(word)
#   if current_scoring > high_score
#     high_word = word
#     high_score = current_scoring
#   elsif current_scoring == high_score
#     if "high"
#       if word.length < high_word.length && high_word.length != 7
#       high_word = word
#       high_score = current_scoring
#       end
#     elsif "short"
#       if word.length < high_word.length
#       high_word = word
#       high_score = current_scoring
#       end
#     end
#   end
# end
# return high_word
# end
# end
