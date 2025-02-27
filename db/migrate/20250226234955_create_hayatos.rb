class CreateHayatos < ActiveRecord::Migration[6.1]
  def change
    create_table :hayatos do |t|
      t.boolean :chat_1, default: false, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
