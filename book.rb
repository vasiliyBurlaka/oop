class Book
  attr_reader :title, :author

  def initialize(title, author)
    @title, @author = title, author
  end

  def ==(other)
    other.class == self.class && @title == other.title && @author == other.author
  end

  def to_s
    @title
  end

  def each
    yield @title
    yield @author
  end

end