class User < ActiveRecord::Base
  has_many :questions, foreign_key: :author_id, dependent: :nullify

  has_attached_file :avatar, styles: { thumb: '50x50#' }, default_url: "/placeholders/avatars/:style.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :name, presence: true
end
