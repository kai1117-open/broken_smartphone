class CreateBakusais < ActiveRecord::Migration[6.1]
  def change
    create_table :bakusais do |t|
      t.boolean :page_1, default: false, null: false
      t.boolean :page_2, default: false, null: false
      t.boolean :page_3, default: false, null: false
      t.boolean :page_4, default: false, null: false
      t.boolean :page_5, default: false, null: false
      t.boolean :page_6, default: false, null: false
      t.boolean :page_7, default: false, null: false
      t.boolean :page_8, default: false, null: false
      t.boolean :page_9, default: false, null: false
      t.boolean :page_10, default: false, null: false
      t.boolean :page_11, default: false, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
