class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :hascredit, :boolean, :default => false
    add_column :users, :braintreeid, :string
  end
end
