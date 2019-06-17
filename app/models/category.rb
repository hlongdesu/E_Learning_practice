class Category < ApplicationRecord
  has_many :lessons
  has_many :words
  validates :name, presence: true
  scope :newest, ->{order(created_at: :desc)}

  def self.has_word?
    Category.where id: Word.select(:category_id).map(&:category_id)
  end
end
