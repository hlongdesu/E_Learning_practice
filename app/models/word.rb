class Word < ApplicationRecord
  belongs_to :category
  has_many :answers
  has_many :results
  has_many :lessons, through: :results

  def correct_answer
    answers.find_by(is_correct: true).content
  end
end
