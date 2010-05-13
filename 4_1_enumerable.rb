# Using the Enumerable module. Note how we get sort and select (and many
# others) for free by implementing each on the collection and <=> on
# the member class.
#
# As an aside, note also how we can print a structured view of the collection
# by implementing inspect, which is called by p

class Book
  attr_reader :author, :title

  def initialize author, title
    @author = author
    @title = title
  end

  def inspect
    "#{title} (#{author})"
  end

  def <=> other
    #title <=> other.title
    author <=> other.author
  end
end

class BookCollection
  include Enumerable
  def initialize
    @books = []
  end

  def << book
    @books << book
  end

  def inspect
    @books.inspect
  end

  def each
    @books.each do |book|
      yield book
    end
  end
end

collection = BookCollection.new
collection << Book.new('Beck, Kent', 'Extreme Programming Explained')
collection << Book.new('Martin, Robert', 'Clean Code')
collection << Book.new('McBreen, Andy', 'Software Craftsmanship')

p collection.sort

p collection.select {|book| book.author =~ /^M/ }
