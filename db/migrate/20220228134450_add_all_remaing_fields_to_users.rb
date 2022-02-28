class AddAllRemaingFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :is_guide, :boolean
    add_column :users, :rating, :integer
  end
end
