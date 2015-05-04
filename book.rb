class Book
  attr_reader :title, :author

  def initialize(title, author)
    @title, @author = title, author
  end

  def ==(other)
    @title == other.title && @author == other.author
  end

  def to_s
    @title
  end

end