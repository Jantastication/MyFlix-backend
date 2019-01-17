class User < ApplicationRecord
    has_many :ratings
    has_many :movies, through: :ratings

    has_secure_password

    # validates :username, :presence => true, :uniqueness => true

    def token
        JWT.encode({ user_id: self.id }, ENV['my_apps_secret'])
    end

end
