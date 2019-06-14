class User < ApplicationRecord
  before_save{email.downcase!}

  has_many :lessons
  has_many :activities
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships
  has_secure_password
  enum role: {member: 0, admin: 1}
  validates :name, presence: true, length: {maximum: Settings.name_length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: {maximum: Settings.email_length},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  validates :password, presence: true,
            length: {minimum: Settings.password_min_length}
  has_secure_password
  mount_uploader :avatar, AvatarUploader
end
