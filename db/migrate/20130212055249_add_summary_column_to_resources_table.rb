class AddSummaryColumnToResourcesTable < ActiveRecord::Migration
  def change
    add_column :resources, :summary, :text
  end
end
