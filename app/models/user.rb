class User < ApplicationRecord
    has_secure_password
    has_many :dishes
    has_many :cuisines, through: :dishes
    validates :name,  presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 }

# def self.from_omniauth(auth)
#     # byebug
#     User.find_or_create_by(uid: auth['uid']) do |u|
#         u.name = auth['info']['name']
#         u.email = auth['info']['email']
#     end
# end

def self.from_omniauth(auth)
    self.find_or_create_by(uid: auth["uid"]) do |u|
        #  byebug
        u.email = auth['info']['email']
        u.password = SecureRandom.hex(20)
        u.name = auth['info']['nickname'].downcase.gsub(" ", "_")
        # u.email = "#{u.name}@github.com"
      end
end


end

