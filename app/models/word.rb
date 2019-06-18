class Word < ApplicationRecord
  belongs_to :category
  has_many :answers
  has_many :results
  has_many :lessons, through: :results
  scope :order_cat, ->{order(category_id: :asc)}

  def correct_answer
    answers.find_by(is_correct: true).content
  end
end
