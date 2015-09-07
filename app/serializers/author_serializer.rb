class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar

  def avatar
    {
        thumb: object.avatar.url(:thumb)
    }
  end
end
