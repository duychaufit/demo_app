class User < ApplicationRecord
    has_secure_password
    # ==Validates================>
    #Full name
    validates :fullname, presence: true, length: {maximum: 40}, format: { with: /\A[a-zA-Z]\z/}
    #Email
    # validates :email, presence: true, length: {maximum: 50}, format: { with: /\A[a-zA-Z]$\\z/}
    validates :email, presence: true, length: {maximum: 50}, uniqueness: true, format: { with: /\A[\w+-.]+@[a-z]+.[a-z]{2,}\z/}
    # Password
    validates :password, presence: true, length: {is: 8}

end
