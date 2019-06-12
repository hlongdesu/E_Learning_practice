class Activity < ApplicationRecord
  belongs_to :user
  enum action_type: {start_lesson: 0, finish_lesson: 1, follow: 2, un_follow: 3}
end
