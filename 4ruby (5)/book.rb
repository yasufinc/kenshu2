class Book
  attr_accessor :title, :price

  def initialize(title, price)
    @title = title
    @price = price
  end

  def rename_title(title)
    @title = title
  end

  def price_increase
    @price *= 2
  end

end

class Comic < Book
  def price_increase
    @price *= 1.5
    @price = @price.to_i
  end
end


class Magazine < Book
  def price_increase
    @price *= 4
  end
end


book1 = Book.new("book1", 1000)
book2 = Comic.new("book2", 2000)
book3 = Magazine.new("book3", 3000)



#確認
p book1, book2, book3
#<Book:0x00007fb195050390 @title="book1", @price=1000>
#<Comic:0x00007fb195050340 @title="book2", @price=2000>
#<Magazine:0x00007fb1950502f0 @title="book3", @price=3000>

p book1.title #"book1"
book1.rename_title("BOOK1")
p book1.title #"BOOK1"

p book1.price #1000
book1.price_increase
p book1.price #2000
p book1 #<Book:0x00007fb195050390 @title="BOOK1", @price=2000>

p book2.title, book3.title #"book2", "book3"
p book2.price, book3.price #2000, 3000
book2.price_increase
book3.price_increase
p book2.price, book3.price #3000, 12000
