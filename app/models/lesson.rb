class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :results, dependent: :destroy
  has_many :words, through: :results, dependent: :destroy
  has_many :answers, through: :results, dependent: :destroy
  before_create :delete_existing_lessons

  def correct_answers
    answers.where is_correct: true
  end

  private

  def delete_existing_lessons
    user.lessons.find_by(category_id: category.id).try(:destroy)
  end
end
