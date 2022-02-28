class CreateFlashcards < ActiveRecord::Migration[6.1]
  def change
    create_table :flashcards do |t|
      t.references :offer, null: false, foreign_key: true
      t.string :question
      t.text :answer

      t.timestamps
    end
  end
end
