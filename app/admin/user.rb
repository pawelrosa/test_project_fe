ActiveAdmin.register User do
  permit_params :name, :avatar

  index do
    selectable_column
    id_column
    column('Avatar') { |c| image_tag(c.avatar.url(:thumb)) }
    column :name
    column('Questions') { |c| c.questions.size }
    actions
  end

  filter :name
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :avatar, as: :file, hint: f.object.avatar.present? ? image_tag(f.object.avatar.url(:thumb)) : content_tag(:span, "No avatar")
    end
    f.actions
  end

end
