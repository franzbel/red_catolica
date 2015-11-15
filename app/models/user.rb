class User < ActiveRecord::Base
  has_secure_password
  has_many :fans
  has_many :idols
  has_many :posts
end
