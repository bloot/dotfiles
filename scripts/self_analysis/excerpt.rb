class Excerpt
  attr_reader :body

  def initialize(body, sentiment)
    @body = body
    @sentiment = sentiment
    @processed = false
  end
end
