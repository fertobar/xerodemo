class AddXeroGuidToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :xero_uid, :string
  end
end
