require "library/version"
require "library/author"
require "library/book"
require "library/reader"
require "library/order"
require 'date'
require 'yaml'

module Library
  # Your code goes here...
  class Library
    COUNT_TOP_BOOKS = 3

    def initialize(authors=[], books=[], readers=[], orders=[])
      @authors = authors
      @books = books
      @readers = readers
      @orders = orders
    end

    def each
      yield @authors
      yield @books
      yield @readers
      yield @orders
    end

    def get_most_popular_book
      get_sorted_elements[0]
    end

    def who_often_takes_the_book(book)
      get_sorted_elements('reader', [book])[0]
    end

    def count_readers_of_most_popular
      top_popular_books = get_sorted_elements[0...COUNT_TOP_BOOKS]
      get_sorted_elements('reader', top_popular_books).length
    end

    def add_elem(elem)
      if [Author, Book, Reader, Order, Library, Array, Hash].include? elem.class
        elem.each { |el| add_elem el }

        if elem.class == Author
          @authors.push elem unless @authors.include? elem
        elsif elem.class == Book
          @books.push elem unless @books.include? elem
        elsif elem.class == Order
          @orders.push elem unless @orders.include? elem
        elsif elem.class == Reader
          @readers.push elem unless @readers.include? elem
        end

      end
    end

    def save_to_file(file_name)
      File.open(file_name, 'w') {|f| f.write(YAML.dump(self)) }
    end

    def self.load_from_file(file_name)
      YAML.load(File.read(file_name))
    end

    private
    def get_sorted_elements(element = 'book', books = @books)
      books = [] if books == nil
      @orders.inject(Hash.new(0)) {|elements, order|
        elements[order[element]]+=1 if books.include? order.book
        elements
      }.sort_by{|key, val|
        -val
      }.to_h.keys
    end

  end
end
