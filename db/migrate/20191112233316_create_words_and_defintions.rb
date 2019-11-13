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
      t.string :record1
      t.string :record2
      t.string :record3
      t.string :record4
      t.string :record5
      t.string :record6
      t.string :record7
      t.string :record8
      t.string :record9
      t.string :record10
    end
  end
end
