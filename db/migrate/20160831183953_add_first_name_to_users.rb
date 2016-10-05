class AddFirstNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :FirstName, :string
    add_column :users, :LastName, :string
    add_column :users, :UserName, :string
    add_column :users, :date_of_birth, :datetime
    add_column :users, :is_female, :boolean, default: false
    add_column :users, :Age, :string
    add_column :users, :Race, :string
    add_column :users, :is_kenyan, :boolean, default: false
    add_column :users, :Country, :string
    add_column :users, :City, :string
    add_column :users, :LookingFor, :text
    add_column :users, :ShortBio, :text
    add_column :users, :LongBio, :text
    add_column :users, :Education, :string
    add_column :users, :Hobby, :text
    add_column :users, :Religion, :string
    add_column :users, :CanMove, :boolean, default: false
  end
end
