class User < ActiveRecord::Base
  #ActiveRecord has the password digesting function for me
  has_secure_password
  # just links these two together , if user is deleted so does his/her deals
  has_many :deals, dependent: :destroy
end
