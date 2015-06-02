class AddUserToPacks < ActiveRecord::Migration
  def change
    add_column :packs, :user_id, :number
  end
end
