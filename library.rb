class Library

    def initialize(authors=[], books=[], readers=[], orders=[])
      @authors = authors
      @books = books
      @readers = readers
      @orders = orders
    end

    def who_often_takes_the_book(book)
      counts = Hash.new(0)
      @orders.select{|order| order.book==book}.map{|order| counts[order.reader] += 1 }
      counts.max_by{|k,v| v}[0]
    end

    def what_is_the_most_popular_book
      counts = Hash.new(0)
      @orders.map{|order|
        counts[order.book] += 1
      }
      counts.max_by{|k,v| v}[0]
    end

    def count_peoples_who_ordered_one_of_three_popular
      counts_book = Hash.new(0)
      @orders.map{|order|
        counts_book[order.book] += 1
      }
      popular = counts_book.sort{|l,r| r[1]<=>l[1]}[0...3]
      counts_reader = Hash.new(0)
      @orders.select{|order| popular[0][0] == order.book || popular[1][0] == order.book || popular[2][0] == order.book}.map{|order| counts_reader[order.reader] = 1}
      counts_reader.length
    end

    def save_to_file(file_name)
      File.open(file_name, 'w') {|f| f.write(YAML.dump(self)) }
    end

    def self.load_from_file(file_name)
      YAML.load(File.read(file_name))
    end

end