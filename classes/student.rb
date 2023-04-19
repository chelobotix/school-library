require_relative 'person'

class Student < Person

  attr_reader :classroom

  def initialize(age, name = 'Unknown')
    super(age, name)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
