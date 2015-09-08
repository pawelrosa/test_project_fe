class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :votes, :created_at

  has_one :author, serializer: AuthorSerializer
end
