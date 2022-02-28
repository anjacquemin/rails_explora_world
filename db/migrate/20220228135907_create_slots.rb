class CreateSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :slots do |t|
      t.references :offer, null: false, foreign_key: true
      t.datetime :start_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
