class AddPackToItems < ActiveRecord::Migration
  def change
    add_column :items, :pack_id, :number
  end
end
