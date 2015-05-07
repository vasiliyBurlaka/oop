module Library
  class Author
    attr_reader :name, :biography

    def initialize(name, biography)
      @name, @biography = name, biography
    end

    def ==(other)
      other.class == self.class && @name == other.name && @biography == other.biography
    end

    def to_s
      "#{@name} => #{@biography}"
    end

    def each
      yield @name
      yield @biography
    end

  end
end