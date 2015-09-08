class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :body, :votes, :created_at

  has_one :author, serializer: AuthorSerializer
  has_many :comments, each_serializer: CommentSerializer
end
