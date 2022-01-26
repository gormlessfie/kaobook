class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  
  devise :omniauthable, omniauth_providers: %i[facebook]

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

  def self.from_omniauth(auth)
    full_name = auth.info.name.split(" ")

    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = "#{full_name[0]}_#{full_name[1]}"
      create_user_extra_info(user, full_name)

      user.skip_confirmation!
    end
  end

  def create_user_extra_info(user, full_name)
    user.create_profile
    user.profile.create_detail
    user.profile.detail.create_age
    user.profile.detail.create_location
    user.profile.detail.create_gender
    user.profile.detail.create_contact_information
    user.profile.detail.create_name(fname: full_name[0], lname: full_name[1])
  end

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
