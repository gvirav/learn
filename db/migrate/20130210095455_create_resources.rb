class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :category
      t.string :title
      t.string :url
      t.integer :votes

      t.timestamps
    end
  end
end
