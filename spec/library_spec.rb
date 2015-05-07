require 'spec_helper'
require 'test_with_init'

lib = hardcode_init
author = Library::Author.new('Richard Bach',
                             "(born June 23, 1937) is an American writer. He is widely known as the author of the hugely" +
                                 " popular 1970s best-sellers Jonathan Livingston Seagull and Illusions: The Adventures of a" +
                                 " Reluctant Messiah, among others. Bach's books espouse his philosophy that our apparent physical"+
                                 " limits and mortality are merely appearance. Bach is noted for his love of flying and for his books"+
                                 " related to air flight and flying in a metaphorical context. He has pursued flying as a hobby since"+
                                 " the age of 17. In late August 2012 Bach was badly injured when on approach to landing at Friday Harbor,"+
                                 " Washington his aircraft clipped some power lines and crashed upside down in a field.")
book = Library::Book.new('Illusions',author)
reader = Library::Reader.new('Vasiliy Burlaka', 'vasiliy.burlaka@gmail.com', 'Dnepropetrovsk', 'Somestreet', '100')


    describe Library do
  it 'has a version number' do
    expect(Library::VERSION).not_to be nil
  end

  it 'does something useful' do
#    expect(false).to eq(true)
  end

  it 'count_readers_of_most_popular' do
    expect(lib.count_readers_of_most_popular).to eq(5)
  end

  it 'get_most_popular_book' do
    expect(lib.get_most_popular_book).to eq(book)
  end

  it 'who_often_takes_the_book' do
    expect(lib.who_often_takes_the_book(book)).to eq(reader)
  end

end
