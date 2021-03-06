class AddAuthorIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :author_id, :integer, index: true
    add_foreign_key :questions, :users, column: :author_id
  end
end
