class Player
  attr_reader :name, :word
  WIN_CONDITION = 100

  def initialize(name)
    @name = name
    @words = []
    @word_score = 0
  end

  def plays
    return @words
  end

  def play(word)
    if self.won? == true
      return false
    end
    @word_score = Scoring.score(word)
    @words << word
    return @word_score
  end

  def total_score
    tally = 0
    @words.each do |word|
      tally += Scoring.score(word)
    end
    return tally
  end

  def won?
    if total_score > WIN_CONDITION
      return true
    end
    return false
  end

  def highest_scoring_word
    words_and_scores = { }
    most = []
    @words.each do |word|
      words_and_scores[word] = (Scoring.score(word))
    end
    most = words_and_scores.max_by do |key, value|
      value
    end
    return most[0]
  end

  def highest_word_score
    words_and_scores = { }
    most = []
    @words.each do |word|
      words_and_scores[Scoring.score(word)] = word
    end
    most = words_and_scores.max_by do |key, value|
      key
    end
    return most[0]
  end
end
