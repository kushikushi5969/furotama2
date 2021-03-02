class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name,        null: false
      t.text :review,        null: false
      t.string :address
      t.references :user, foreign_key: true
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
