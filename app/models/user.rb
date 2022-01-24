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
  has_many :friends, through: :friendships, source: :friend, dependent: :destroy

  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_one :profile, dependent: :destroy

  def sent_invitation?(user, friend)
    !!self.friendships.find { |invite| invite.user_id == user.id &&
      invite.friend_id == friend.id }
  end

  def receive_invitation?(user, friend)
    !!self.inverse_friendships.find { |invite| invite.friend_id == user.id && invite.active == false }
  end

  def friend?(user, friend)
    !!Friendship.find_by(active: true, user: user, friend: friend) || Friendship.find_by(active: true, user: friend, friend: user)
  end

  def is_friend_of(user, friend)
    @friendship = self.friendships.find_by(active: true, user: user, friend: friend)
    @friendship = self.inverse_friendships.find_by(active: true, user: friend, friend: user) if @friendship.nil?

    @friendship
  end
end
