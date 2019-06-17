class Category < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :words, dependent: :destroy
  validates :name, presence: true
  scope :newest, ->{order(created_at: :desc)}

  def self.has_word?
    Category.where id: Word.select(:category_id).map(&:category_id)
  end

  def lesson user
    @lesson ||= lessons.find_by(user: user)
  end
end
