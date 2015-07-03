class RemoveIpAddressFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :ip_address, :string
  end
end
