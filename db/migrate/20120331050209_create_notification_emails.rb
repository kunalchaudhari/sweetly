class CreateNotificationEmails < ActiveRecord::Migration
  def change
    create_table :notification_emails do |t|
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
