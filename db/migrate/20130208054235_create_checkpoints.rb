class CreateCheckpoints < ActiveRecord::Migration
  def change
    create_table :checkpoints do |t|
      t.string :name
      t.text :purpose
      t.boolean :complete
      t.datetime :deadline

      t.timestamps
    end
  end
end
