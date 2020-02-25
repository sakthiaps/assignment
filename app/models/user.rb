
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  # has_many :followers, inverse_of: :user, foreign_key: 'associated_id'
  has_many :followers
  has_one :associated_user, inverse_of: :user,
          class_name: 'Follower',
          foreign_key: 'associated_id'

end
