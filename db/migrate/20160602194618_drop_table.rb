class DropTable < ActiveRecord::Migration
  def change
    drop_table :categories_tools
  end
end
