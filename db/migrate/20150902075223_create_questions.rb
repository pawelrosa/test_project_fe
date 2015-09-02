class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :head, null: false, default: ''
      t.text :body, null: false, default: ''
      t.integer :votes, default: 0
      t.timestamps null: false
    end
  end
end
