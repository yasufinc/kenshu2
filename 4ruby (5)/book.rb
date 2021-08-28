class Book
  attr_accessor :title, :price

  def initialize(title, price)
    @title = title
    @price = price
  end

  def rename_title(title)
    @title = title
  end

  def price_increase()
    @price *= 2
  end

end

class Comic < Book
  def price_increase()
    @price *= 1.5
  end
end


class Magazine < Book
  def price_increase()
    @price *= 4
  end
end


book1 = Book.new("book1", 1000)
book2 = Comic.new("book2", 2000)
book3 = Magazine.new("book3", 3000)



#確認
p book1, book2, book3

p book1.title
book1.rename_title("BOOK1")
p book1.title

p book1.price
book1.price_increase
p book1.price
p book1

p book2.title, book3.title
p book2.price, book3.price
book2.price_increase
book3.price_increase
p book2.price, book3.price
