class JournalCollection
  attr_reader :journals

  def initialize(path)
    @journals = File.open(path).read.split.tap{|j| Journal.new(j)}
  end

end
