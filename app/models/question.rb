class Question < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :answers, -> { order(created_at: :asc)}, dependent: :destroy

  accepts_nested_attributes_for :answers, allow_destroy: true

  validates :head, :body, presence: true

  def activities
    answer_ids = self.answers.ids
    (self.answers + Answer.where('parent_id IN (?)', answer_ids)).sort { |a,b| a.created_at <=> b.created_at }
  end

  def related_discussions_counter
    Answer.select('DISTINCT answers.id').where('parent_id IN (?)', self.answers.ids).count
  end

  def peers_involved_counter
    answer_ids = self.answers.ids
    User.select('DISTINCT users.id').joins('JOIN answers ON users.id = answers.author_id').where('answers.id IN (?) OR answers.parent_id IN (?)', answer_ids, answer_ids).count
  end

  def conversations_counter
    self.answers.count
  end
end
