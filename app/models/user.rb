class User < ApplicationRecord
    has_many :movies
    has_secure_password

    validates :username, :presence => true, :uniqueness => true

end
