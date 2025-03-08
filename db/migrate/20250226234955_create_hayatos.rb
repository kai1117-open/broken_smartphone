class CreateHayatos < ActiveRecord::Migration[6.1]
  def change
    create_table :hayatos do |t|
      t.string :chat_1, null: true
      t.string :chat_2, null: true
      t.string :chat_3, null: true
      t.string :chat_4, null: true
      t.string :chat_5, null: true
      t.string :chat_6, null: true
      t.string :chat_7, null: true
      t.string :chat_8, null: true
      t.string :chat_9, null: true
      t.string :chat_10, null: true
      t.string :chat_11, null: true
      t.string :chat_12, null: true
      t.string :chat_13, null: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
