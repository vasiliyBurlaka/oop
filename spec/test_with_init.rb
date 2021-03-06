puts File.dirname(__FILE__)
require File.dirname(__FILE__) + '/spec_helper.rb'
require 'library'

def hardcode_init
  authors = [
      Library::Author.new('Richard Bach',
                 "(born June 23, 1937) is an American writer. He is widely known as the author of the hugely" +
                 " popular 1970s best-sellers Jonathan Livingston Seagull and Illusions: The Adventures of a" +
                 " Reluctant Messiah, among others. Bach's books espouse his philosophy that our apparent physical"+
                 " limits and mortality are merely appearance. Bach is noted for his love of flying and for his books"+
                 " related to air flight and flying in a metaphorical context. He has pursued flying as a hobby since"+
                 " the age of 17. In late August 2012 Bach was badly injured when on approach to landing at Friday Harbor,"+
                 " Washington his aircraft clipped some power lines and crashed upside down in a field."),
      Library::Author.new('Hiroshi Sakurazaka',
                "Sakurazaka made his debut in 2002 at the second Super Dash Novel Rookie of the Year Award with the novel"+
                " Mahō tsukai no netto, which was later published in December 2003 under the name Yoku Wakaru Gendai Mahō."+
                "This work has subsequently been expanded into a series of light novels and has also been made into an anime."+
                " In 2004 he was presented the S-F Magazine Readers Award's best short story award for Saitama Chainsaw Shōjo "+
                "(さいたまチェーンソー少女?). His 2004 novel All You Need Is Kill, received high praise from other authors in "+
                "Japan and has subsequently been published in English by Viz Media."),
      Library::Author.new('Some Good People', "work hard, something do")
  ]

  books = [
      Library::Book.new('Jonathan Livingston Seagull', authors[0]),
      Library::Book.new('All You Need Is Kill', authors[1]),
      Library::Book.new('Bible', authors[2]),
      Library::Book.new('Illusions', authors[0])
  ]

  readers = [
      Library::Reader.new('Vasiliy Burlaka', 'vasiliy.burlaka@gmail.com', 'Dnepropetrovsk', 'Somestreet', '100'),
      Library::Reader.new('Some another man', 'some_another_man@gmail.com', 'Dnepropetrovsk', 'Somestreet', '100'),
      Library::Reader.new('Creapy man', 'creapy@gmail.com', 'Dnepropetrovsk', 'Somestreet', '100'),
      Library::Reader.new('Creapy man2', 'creapy@gmail.com3', 'Dnepropetrovsk', 'Somestreet', '100'),
      Library::Reader.new('Creapy man3', 'creapy@gmail.com4', 'Dnepropetrovsk', 'Somestreet', '100'),
      Library::Reader.new('Creapy man4', 'creapy@gmail.com5', 'Dnepropetrovsk', 'Somestreet', '100')
  ]

  orders = [
      Library::Order.new(books[0], readers[2]),
      Library::Order.new(books[1], readers[1]),
      Library::Order.new(books[0], readers[0]),
      Library::Order.new(books[3], readers[0]),
      Library::Order.new(books[3], readers[0]),
      Library::Order.new(books[2], readers[5]),
      Library::Order.new(books[3], readers[2]),
      Library::Order.new(books[3], readers[3])
  ]
  lib1 = Library::Library.new(authors, books, readers, orders)

  lib = Library::Library.new()
  lib.add_elem(orders[0..2])
  lib.add_elem(lib1)
  lib.add_elem(Library::Order.new(books[3], readers[4]))
  lib
end




#lib.save_to_file('test.txt')
#lib = Library::Library.load_from_file('test.txt')

#puts lib.who_often_takes_the_book(books[3])
#puts "______"
#puts lib.get_most_popular_book
#puts "______"
#puts lib.count_readers_of_most_popular
