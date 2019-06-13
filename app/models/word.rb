class Word < ApplicationRecord
  belongs_to :category
  has_many :answers
  has_many :results
  has_many :lessons, through: :results
end
