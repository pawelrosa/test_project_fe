class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :head, :body, :votes, :created_at

  has_one :author, serializer: AuthorSerializer
end
