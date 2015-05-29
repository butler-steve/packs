class CreatePacks < ActiveRecord::Migration
  def change
    create_table :packs do |t|
      t.string :name
      t.integer :expiration_interval
      t.string :sched_algo

      t.timestamps
    end
  end
end
