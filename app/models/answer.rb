class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user, through: :question
  has_many :votes, as: :votable
end
