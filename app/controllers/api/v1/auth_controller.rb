class Api::V1::AuthController < ApplicationController
    def create 
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            render json: {
                token: JWT.encode({ user_id: user.id }, 'my_apps_secret'), 
                user: user
            }
        else
            render json: {
                error: 'username or password are incorrect'
            }
        end
    end
end
