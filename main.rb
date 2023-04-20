require_relative 'app'

def main
  is_active = true
  available_options = ('1'..'7').to_a

  print "\nWelcome to School Library App!\n\n"

  while is_active
    print "\nPlease choose an option by entering a number:\n\n"
    puts "1. List all books"
    puts "2. List all people"
    puts "3. Create a person"
    puts "4. Create a book"
    puts "5. Create a rental"
    puts "6. List all rentals for a given person id"
    puts "7. Exit"

    option = gets.chomp

    if available_options.include?(option)

      if(option == '7')
        puts 'Have a nice day :)'
        exit!

      elsif(option == '3')
        puts 'Do you want to create a student (1) or a teacher (2) [Input the number]:'
        option2 = gets.chomp

        if (['1', '2'].include?(option2))
          option_student if option2 == '1'
          option_teacher if option2 == '2'
        end

      else
        send("option#{option}")
      end

    else
      puts '** Option not available - Please try again **'
    end

  end
end

main







