require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  #We'll need to create validations and associations here

 def password
    @password ||= Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end

  def self.authenticate(username,plain_text_password)
    user = self.find_by(username: username)
    return user if user && user.password == plain_text_password
  end
end
