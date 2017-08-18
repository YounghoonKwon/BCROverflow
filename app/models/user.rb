require 'bcrypt'

class User < ActiveRecord::Base
  has_many :questions
  has_many :answers, through: :questions

  validates :username, presence: true, uniqueness: true
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :email, presence:true, uniqueness: true

  include BCrypt

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(username, plain_text_password)
    user = self.find_by(username: username)
    return user if user && user.password == plain_text_password
  end
end
