class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body, null: false, default: ''
      t.belongs_to :question, index: true, foreign_key: true
      t.integer :author_id, index: true
      t.integer :parent_id, index: true
      t.integer :votes, default: 0
      t.timestamps null: false
    end

    add_foreign_key :answers, :users, column: :author_id
    add_foreign_key :answers, :answers, column: :parent_id
  end
end
