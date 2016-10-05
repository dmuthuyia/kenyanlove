class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.string :url
      t.text :tags
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
