class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i(github)

  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

  has_many :active_following_relationships, class_name:  "FollowingRelationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_following_relationships, class_name:  "FollowingRelationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :followings, through: :active_following_relationships, source: :followed
  has_many :followers, through: :passive_following_relationships, source: :follower

  def self.create_unique_string
    SecureRandom.uuid
  end

  def self.find_for_github_oauth(auth, signed_in_resource=nil)
    user = User.find_by(provider: auth.provider, uid: auth.uid)

    unless user
      user = User.new(provider: auth.provider,
                      uid:      auth.uid,
                      name:     auth.info.name,
                      email:    User.dummy_email(auth),
                      password: Devise.friendly_token[0, 20]
      )
    end
    user.save
    user
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

  def follow(other_user)
    followings << other_user
  end

  def unfollow(other_user)
    active_following_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end

end
