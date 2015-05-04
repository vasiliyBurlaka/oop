class Order
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    @book, @reader = book, reader
    @date = date.is_a?(String) ? Date.parse(date) : date
  end

  def ==(other)
    @book == other.book && @reader == other.reader && @date == other.date
  end

  def to_s
    "#{@book} => reader:#{reader}"
  end
end