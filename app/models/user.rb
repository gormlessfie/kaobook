class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :username, presence: true, length: { in: 3..12 }

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, source: :friend
  has_one :profile, dependent: :destroy

  def sent_invitation?(user, friend)
    !!self.friendships.find{ |invite| invite.user_id == user.id &&
                                        invite.friend_id == friend.id }
  end
end
