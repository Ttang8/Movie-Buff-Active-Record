class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true
  validate :not_duplicate_response
  validate :cant_answer_self_poll

  belongs_to :answerchoice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answerchoice,
    source: :question


  def sibling_responses
    responses = self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    !self.sibling_responses.empty?
  end

  def not_duplicate_response
    if respondent_already_answered?
      self.errors.add(:user_id,"Cant send same response")
    end
  end

  def cant_answer_self_poll
    poll = self.answerchoice.question.poll
    if self.user_id = poll.user_id
      self.errors.add(:user_id,"Cant answer your own questions!")
    end
  end
end
