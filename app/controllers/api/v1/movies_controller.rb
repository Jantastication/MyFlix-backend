class Api::V1::MoviesController < Api::V1::ApplicationController
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

    def my_movies

        #find the user
        # user.find
        #WATCHLIST - JUST ADDED= find the ratings in which user is self and score is null/nil/whateva
        #WATCHED - JUST RATED = find the rating in which user is self and score is not null
        #return an object/hash like {myWatchList: WATCHLIST(JUST ADDED),  watched: WATCHED(JUST RATED)}
        @user = User.find(params[:user_id])
        # puts(@user)
        
        # @myRatings = Rating.where(:user_id => @user.id)
        # @myMovies = @myRatings.map{|rating| Movie.find(rating.movie_id )}
        
        render json: @user.movies
    
        
    end

    def destroy_my_movie
        @rating = Rating.where(user_id: params[:user_id], movie_id: params[:movie_id])
        Rating.destroy(@rating[0].id)
        render json: @rating
    end
    
    def current_movie
        @current_movie
    end
end
