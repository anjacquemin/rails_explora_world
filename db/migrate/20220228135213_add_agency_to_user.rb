class AddAgencyToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :agency, null: false, foreign_key: true
  end
end
