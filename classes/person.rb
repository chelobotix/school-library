require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission = 1)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    parent_permission == 1 ? @parent_permission = true : @parent_permission = false
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    new_rental = Rental.new(date, self, book)
    @rentals << new_rental
    book.rentals << new_rental
  end

  private

  def of_age?
    @age > 18
  end
end
