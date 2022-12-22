class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: { with: /([a-z0-9_.-]+)@([\da-z.-]+).([a-z.]{2,6})/, message: "use a valid email" }
end
