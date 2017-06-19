require 'pry'
require_relative 'excerpt_collection'

class ExcerptSentimentAnalyzer
  attr_reader :excerpts

  def initialize(excerpts)
    @excerpts = excerpts
  end
end

binding.pry
analyzer = ExcerptSentimentAnalyzer.new(ExcerptCollection.new("./data/yelp_labelled.txt"))
p analyzer.excerpts
