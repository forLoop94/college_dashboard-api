class LessonSubmission < ApplicationRecord
  belongs_to :user
  belongs_to :lesson_area
end
