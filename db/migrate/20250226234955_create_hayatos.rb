class CreateHayatos < ActiveRecord::Migration[6.1]
  def change
    create_table :hayatos do |t|
      t.string :chat_1, null: true
      
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
