class Order
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    @book, @reader = book, reader
    @date = date.is_a?(String) ? Date.parse(date) : date
  end

  def ==(other)
    other.class == self.class && @book == other.book && @reader == other.reader && @date == other.date
  end

  def to_s
    "#{@book} => reader:#{reader}"
  end

  def [](elem)
    if elem=='book'
      @book
    elsif elem=='reader'
      @reader
    elsif elem=='date'
      @date
    else
      nil
    end
  end

  def each
    yield @book
    yield @reader
    yield @date
  end

end