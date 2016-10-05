class CreateCans < ActiveRecord::Migration
  def change
    create_table :cans do |t|
      t.integer :user_id
      t.string :Gender
      t.string :FirstName
      t.string :LastName
      t.string :UserName
      t.string :Age
      t.string :City
      t.string :Country
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
