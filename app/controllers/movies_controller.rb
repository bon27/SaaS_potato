class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end
  
  def order
    @item = params[:item]
    @movies = Movie.find(:all,:order=>@item)
  # item in database is :  :title, :rating, :description， :release_date
  end  
  
      

  def index
    @all_ratings = Movie.get_ratings
    if params.has_key? :ratings
      @chosen_rating = params['ratings'].keys
    else
      @chosen_rating = @all_ratings
    end
    
    #@movies = Movie.where(:rating=>'')
    @movies = Movie.find(:all, :conditions=>{:rating=>(@chosen_rating)})
          
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
