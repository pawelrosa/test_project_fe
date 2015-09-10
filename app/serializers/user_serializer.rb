class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar

  def avatar
    {
        normal: object.avatar.url(:normal),
        thumb: object.avatar.url(:thumb)
    }
  end
end
