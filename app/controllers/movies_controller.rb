class MoviesController < ApplicationController
  def new
    @movie = Movie.new

    render template: "movies/new.html.erb"
  end

  def index
    matching_movies = Movie.all

    @movies = matching_movies.order({ :created_at => :desc })

    respond_to do |format|
      format.json do
        render json: @list_of_movies
      end

      format.html do
        render({ :template => "movies/index.html.erb" })
      end
    end
  end

  def show

    # @the_movie = Movie.where(id: params.fetch(:id)).first

    @movie = Movie.find(params.fetch(:id))
  end

  def create
    movie_attributes = params.require(:movie).permit(:title, :description)
    
    @movie = Movie.new(movie_attributes)

    if @movie.valid?
      @movie.save
      redirect_to movies_url, notice: "Movie created successfully."
    else
      render template: "new"
    end
  end

  def edit
    @movie = Movie.find(params.fetch(:id))
  end

  def update
    the_id = params.fetch(:id)
    movie = Movie.where({ :id => the_id }).first

    movie.title = params.fetch("query_title")
    movie.description = params.fetch("query_description")

    if movie.valid?
      movie.save
      redirect_to("/movies/#{movie.id}", { :notice => "Movie updated successfully."} )
    else
      redirect_to("/movies/#{movie.id}", { :alert => "Movie failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch(:id)
    movie = Movie.where({ :id => the_id }).first

    movie.destroy

    redirect_to("/movies", { :notice => "Movie deleted successfully."} )
  end
end
