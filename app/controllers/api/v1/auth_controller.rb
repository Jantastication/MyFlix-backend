class Api::V1::AuthController < Api::V1::ApplicationController
    def create 
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            render json: {
                token: JWT.encode({ user_id: user.id }, ENV['my_apps_secret']), 
                user: user
            }
        else
            render json: {
                error: 'username or password are incorrect'
            }
        end
    end
end
