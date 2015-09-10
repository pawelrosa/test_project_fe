class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :type

  has_one :author, serializer: AuthorSerializer

  def type
    object.parent_id.nil? ? 'Answered' : 'Commented'
  end
end