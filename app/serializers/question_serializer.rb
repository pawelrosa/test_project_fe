class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :head, :body, :votes, :created_at, :followed

  has_one :author, serializer: AuthorSerializer
  has_many :answers, each_serializer: AnswerSerializer

  def followed
    object.id % 3 == 0
  end
end
