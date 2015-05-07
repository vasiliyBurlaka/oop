module Library
  class Reader
    attr_reader :name, :email, :city, :street, :house

    def initialize (name, email, city, street, house)
      @name = name
      @email = email
      @city = city
      @street = street
      @house = house
    end

    def ==(other)
      other.class == self.class && @email == other.email && @name == other.name
    end

    def to_s
      "Name: #{@name}\nEmail: #{@email}\nCity: #{@city}\nStreet: #{@street}\nHouse: #{@house}"
    end

    def each
      yield @name
      yield @email
      yield @city
      yield @street
      yield @house
    end
  end
end