class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string     :image,     null: false
      t.references :post,      foreign_key: true

      t.timestamps
    end
  end
end
