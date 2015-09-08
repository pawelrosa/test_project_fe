class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :parent, class_name: 'Answer', foreign_key: :parent_id
  has_many :comments, class_name: 'Answer', foreign_key: :parent_id

  accepts_nested_attributes_for :comments, allow_destroy: true

  validates :body, presence: true
end