class CreateBakusais < ActiveRecord::Migration[6.1]
  def change
    create_table :bakusais do |t|
      t.boolean :page_1, default: false, null: false
      t.boolean :page_2, default: false, null: false
      
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
