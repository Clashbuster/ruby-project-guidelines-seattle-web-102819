class CreateWordsAndDefintions < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.string :name
      t.integer :word_length
      t.integer :num_of_definitions
    end

    create_table :definitions do |t|
      t.integer :word_id
      t.integer :user_id
      t.string :record
    end
  end
end
