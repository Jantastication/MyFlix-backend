class Api::V1::RatingsController <Api::V1::ApplicationController
    before_action :define_current_rating

    # skip_before_action :check_authentication, only: [ :index, :create ]
    
    def create
        rating = Rating.create(rating_params)
        render json: rating
    end
    
    def index
        render json: Rating.all
    end
    
    def show
        render json: current_rating
    end
    
    def update
        current_rating.update(rating_params)
        render json: current_rating
    end
    
    def destroy
        current_rating.destroy
        render json: current_rating
    end
    
    def rating_params
        params.require(:rating).permit(:score, :comment, :user_id, :movie_id)
    end
    
    def define_current_rating
        if params[:id]
            @current_rating = Rating.find(params[:id])
        else
            @current_rating = Rating.new
        end
    end
    
    def current_rating
        @current_rating 
    end
end
