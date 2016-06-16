class CreateJoinTableToolsCategories < ActiveRecord::Migration
  def change
    create_join_table :tools, :categories do |t|
      t.index [:tool_id, :category_id]
      t.index [:category_id, :tool_id]
    end
  end
end
