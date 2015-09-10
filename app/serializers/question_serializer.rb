class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :head, :body, :votes, :created_at, :stats, :followed

  has_one :author, serializer: AuthorSerializer
  has_many :answers, each_serializer: AnswerSerializer
  has_many :activities, each_serializer: ActivitySerializer

  def stats
    {
        related_discussions: object.related_discussions_counter,
        peers_involved: object.peers_involved_counter,
        conversations: object.conversations_counter
    }
  end

  def followed
    object.id % 3 == 0
  end
end
