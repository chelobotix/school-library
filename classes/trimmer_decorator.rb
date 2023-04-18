require_relative 'decorator_base'

class TrimmerDecorator < DecoratorBase


  def correct_name
    @nameable.correct_name[0..9]
  end

end
