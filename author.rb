class Author
  attr_reader :name, :biography

  def initialize(name, biography)
    @name, @biography = name, biaphy
  end

  def ==(another)
    @name == another.name && @biography == another.biography
  end

  def to_s
    "#{@name} => #{@biography}"
  end

end