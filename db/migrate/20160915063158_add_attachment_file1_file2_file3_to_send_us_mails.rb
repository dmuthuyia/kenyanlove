class AddAttachmentFile1File2File3ToSendUsMails < ActiveRecord::Migration
  def self.up
    change_table :send_us_mails do |t|
      t.attachment :file1
      t.attachment :file2
      t.attachment :file3
    end
  end

  def self.down
    remove_attachment :send_us_mails, :file1
    remove_attachment :send_us_mails, :file2
    remove_attachment :send_us_mails, :file3
  end
end
