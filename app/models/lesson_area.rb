class LessonArea < ApplicationRecord
  belongs_to :student
  belongs_to :course
  belongs_to :lecturer

  has_many :chats, dependent: :destroy
  has_many :lesson_submissions, dependent: :destroy
end
