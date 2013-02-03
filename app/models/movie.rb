class Movie < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  def self.get_ratings
    all_ratings = self.select('rating').map{|c| c.rating}.uniq
    
  end  
    
end
