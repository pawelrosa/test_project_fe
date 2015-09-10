ActiveAdmin.register Question do
  permit_params :head, :body, :author_id, :votes, answers_attributes: [
                    :id, :body, :author_id, :votes, :_destroy, comments_attributes: [
                        :id, :body, :author_id, :votes, :_destroy
                       ]
                     ]

  index do
    selectable_column
    id_column
    column :head
    column('Author') { |c| c.author.present? ? link_to(c.author.name, admin_user_path(c.author)) : '' }
    column :votes
    actions
  end

  filter :name
  filter :created_at

  form do |f|
    f.inputs "Question Details" do
      f.input :head
      f.input :body
      f.input :author_id, as: :select, collection: User.all.map { |u| [u.name, u.id] }
      f.input :votes
      f.has_many :answers, allow_destroy: true do |a|
        a.input :body
        a.input :author_id, as: :select, collection: User.all.map { |u| [u.name, u.id] }
        a.input :votes
        a.has_many :comments, allow_destroy: true do |c|
          c.input :body
          c.input :author_id, as: :select, collection: User.all.map { |u| [u.name, u.id] }
          c.input :votes
        end
      end
    end
    f.actions
  end

end
