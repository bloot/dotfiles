require_relative 'excerpt'

class ExcerptCollection
  attr_reader :excerpts

  def initialize(path)
    @excerpts = File.open(path).read.split("\n").map do |e|
      Excerpt.new(*e.split("\t"))
    end
  end

end
