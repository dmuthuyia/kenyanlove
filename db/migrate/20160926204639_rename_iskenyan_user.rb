class RenameIskenyanUser < ActiveRecord::Migration

  def self.up
    #rename_column :users, :is_kenyan, :kenyan
   
    change_column :users, :is_kenyan, :boolean, default: true
  end

  def self.down
    #change_column :users, :is_kenyan, :boolean, default: false
  end

end
