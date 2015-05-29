class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :content
      t.datetime :last_chosen
      t.integer :weight
      t.boolean :accepted

      t.timestamps
    end
  end
end
