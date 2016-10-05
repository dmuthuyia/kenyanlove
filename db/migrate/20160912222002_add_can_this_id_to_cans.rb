class AddCanThisIdToCans < ActiveRecord::Migration
  def change
    add_column :cans, :Can_this_id, :integer
    add_column :cans, :email, :string
  end
end
