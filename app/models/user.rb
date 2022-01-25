class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :username, presence: true, length: { in: 3..12 }

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy


  has_many :pending_friendships, -> { where(active: false) },
    class_name: 'Friendship', dependent: :destroy
  has_many :pending_friends, through: :pending_friendships, source: :friend,
    dependent: :destroy

  has_many :accepted_friendships, -> { where(active: true) },
    class_name: 'Friendship', dependent: :destroy
  has_many :accepted_friends, through: :accepted_friendships, source: :friend,
    dependent: :destroy


  has_many :inverse_pending_friendships, -> { where(active: false) },
    class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy
  has_many :inverse_pending_friends, through: :inverse_pending_friendships,
    source: :user

  has_many :inverse_accepted_friendships, -> { where(active: true) },
    class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy
  has_many :inverse_accepted_friends, through: :inverse_accepted_friendships,
    source: :user

  has_one :profile, dependent: :destroy

  def sent_invitation?(user, friend)
    !!self.pending_friendships.find do |invite|
      invite.user_id == user.id && invite.friend_id == friend.id
    end
  end

  def receive_invitation?(user, friend)
    !!self.inverse_pending_friendships.find do |invite|
      invite.friend_id == user.id && invite.active == false
    end
  end

  def friend?(user, friend)
    !!Friendship.find_by(active: true, user: user, friend: friend) ||
    !!Friendship.find_by(active: true, user: friend, friend: user)
  end

  def is_friend_of(user, friend)
    @friendship = self.accepted_friendships
      .find_by(active: true, user: user, friend: friend)

    @friendship = self.inverse_accepted_friendships
      .find_by(active: true, user: friend, friend: user) if @friendship.nil?

    @friendship
  end
end
