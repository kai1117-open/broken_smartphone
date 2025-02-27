class CreateLineGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :line_groups do |t|
      t.string :chat_1, null: true
      t.string :chat_2, null: true
      t.string :chat_3, null: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
