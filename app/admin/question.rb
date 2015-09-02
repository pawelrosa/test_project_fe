ActiveAdmin.register Question do
  permit_params :head, :body, :author_id, :votes

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
    end
    f.actions
  end

end