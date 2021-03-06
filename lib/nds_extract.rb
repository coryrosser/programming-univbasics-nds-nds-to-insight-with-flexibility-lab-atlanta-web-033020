# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  movies_with_name = []
  i = 0 
  while i < movies_collection.length do
    movies_with_name.push(movie_with_director_name(name, movies_collection[i]))
    i +=1 
  end
  movies_with_name
end


def gross_per_studio(collection)
  
  gross_earnings = {}
  i = 0 
  
  while i < collection.length do 
    if !gross_earnings[collection[i][:studio]]
      gross_earnings[collection[i][:studio]] = collection[i][:worldwide_gross]
    else 
      gross_earnings[collection[i][:studio]] += collection[i][:worldwide_gross]
    end 
    i += 1 
    
  end
  gross_earnings
end

def movies_with_directors_set(source)
  movie_array = []
  i = 0 
  while i < source.length do 
    movie_array.push(movies_with_director_key(source[i][:name], source[i][:movies]))
    i += 1 
  end
  movie_array
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
