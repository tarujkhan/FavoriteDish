class User < ApplicationRecord
    has_secure_password
    has_many :dishes
    has_many :cuisines, through: :dishes
    validates :name,  presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 }

def self.from_omniauth(auth)
    # byebug
    User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
    end
end


end

