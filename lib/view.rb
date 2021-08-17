class View
  # View can also be stateless as no instance variables are necessary
  def display(recipes_arr)
    if recipes_arr.empty?
      puts "There's no recipe"
    else
      puts "Here are the current recipes:"
      recipes_arr.each_with_index do |item, index|
        mark = item.status ? "X" : " "
        puts "#{index + 1}. [#{mark}] #{item.name} - #{item.description} (#{item.rating} / 5);"
      end
    end
  end

  def display_search(recipes_arr)
    if recipes_arr.empty?
      puts "Search failed"
    else
      puts "Here are the search results:"
      recipes_arr.each_with_index do |item, index|
        puts "#{index + 1}. #{item.name} - #{item.description} (#{item.rating} / 5);"
      end
    end
  end

  def taking_instructions
    puts "Do you want to proceed? y / n"
    instruction = gets.chomp.downcase
    return instruction == "y"
  end

  def ask_for_new_recipe
    return [nil, nil, nil] unless taking_instructions

    puts "Please input the recipe name: "
    name_input = gets.chomp
    puts "Please input the recipe description: "
    description_input = gets.chomp
    puts "How would you rate the recipe? (1 to 5)"
    rating_input = gets.chomp.to_i
    return [name_input, description_input, rating_input]
  end

  def ask_for_index
    return [nil, nil, nil] unless taking_instructions

    puts "Please input the index of the recipe to be processed:"
    index_input = gets.chomp.to_i - 1
    return index_input
  end

  def ask_for_search_keyword
    puts "Please input the keyword for searching:"
    kw = gets.chomp.downcase
    return kw
  end
end
