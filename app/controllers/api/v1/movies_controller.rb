class Api::V1::MoviesController < ApplicationController
    before_action :define_current_movie
    
    def create
        movie = Movie.create(movie_params)
        render json: movie
    end
    
    def index
        render json: Movie.all
    end
    
    def show
        render json: current_movie
    end
    
    def update
        current_movie.update(movie_params)
        render json: current_movie
    end
    
    def destroy
        current_movie.destroy
        render json: current_movie
    end
    
    def movie_params
        params.require(:movie).permit(:title, :year, :rated, :released, :runtime, :genre, :director, :writer, :actors, :plot, :language, :awards, :poster, :ratings, :metascore, :imdbRating, :imdbID, :production, :type, :website, :user_id)
    end
    
    def define_current_movie
        if params[:id]
            @current_movie = Movie.find(params[:id])
        else
            @current_movie = Movie.new
        end
    end
    
    def current_movie
        @current_movie
    end
end
