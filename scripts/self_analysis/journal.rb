class Journal
  attr_reader :body

  def initialize(body)
    @body = body
    @processed = false
  end
end
