class Question < ActiveRecord::Base
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, allow_destroy: true

  validates :head, :body, presence: true

end
