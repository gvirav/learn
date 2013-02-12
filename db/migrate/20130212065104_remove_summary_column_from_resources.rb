class RemoveSummaryColumnFromResources < ActiveRecord::Migration
  def up
    remove_column :resources, :summary, :text
  end

  def down
    add_column :resources, :summary, :text
  end
end
