class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.references :category, null: false, foreign_key: true
      t.text :description
      t.string :video_type
      t.string :city
      t.string :title
      t.float :price

      t.timestamps
    end
  end
end
