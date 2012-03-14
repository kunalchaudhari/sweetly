class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :lastname
      t.string :firstname
      t.string :email
      t.string :company
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :type

      t.timestamps
    end
  end
end
