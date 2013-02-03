module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end
  def order_path(item,ratings)
     result = movies_path+"?item=#{item}"
     ratings.each do |rate|
     	result += "&ratings[#{rate}]=#{rate}"  
     end
     return result
  end
end
