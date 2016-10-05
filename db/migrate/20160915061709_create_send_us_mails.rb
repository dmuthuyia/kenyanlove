class CreateSendUsMails < ActiveRecord::Migration
  def change
    create_table :send_us_mails do |t|
      t.string :FirstName
      t.string :LastName
      t.string :phone
      t.string :email
      t.string :subject
      t.text :message
      t.string :nickname
      t.attachment :file



      t.timestamps null: false
    end
  end
end