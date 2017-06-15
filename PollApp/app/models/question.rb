class Question < ApplicationRecord
  validates :text, presence: true
  validates :poll_id, presence: true, uniqueness: true

  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    ans = self.answer_choices
    hash = {}
    ans.each do |answer|
      hash[answer] = answer.responses.count
    end
    hash
  end
end
