class CreateRaids < ActiveRecord::Migration
  def change
    create_table :raids do |t|
      t.string :name, :null => false
      t.datetime :date, :null => false, :index => true
      t.text :note

      t.boolean :finalized, :default => false, :null => false

      t.references :account, :null => false, :index => true

      t.integer :groups, :default => 1, :null => false
      t.integer :size, :default => 30, :null => false
      t.integer :tanks, :default => 2, :null => false
      t.integer :healing, :default => 6, :null => false
      t.integer :dps, :default => 0, :null => false

      t.timestamps
    end
  end
end