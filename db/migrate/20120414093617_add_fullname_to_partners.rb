class AddFullnameToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :fullname, :string
  end
end
