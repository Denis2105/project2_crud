class User < ActiveRecord::Base
  #ActiveRecord has the password digesting function for me
  has_secure_password
  has_many :deals
end
