class Api::V1::AuthController < Api::V1::ApplicationController
    def create 
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            render json: user, methods:[ :token ]
        else
            render json: {
                error: 'username or password are incorrect',
                status: 401
            }
        end
    end

    def get_user_from_token
        @user = logged_in_user
        render json: @user, methods:[ :token ]
    end
end
