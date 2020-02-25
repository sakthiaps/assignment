
class Follower < ApplicationRecord

  belongs_to :user
  belongs_to :associated, inverse_of: :followers,
              class_name: 'User'

end
