class AddPrimaryKeyToPerson < ActiveRecord::Migration
  def change
    add_column :people, :primary_key, :integer
  end
end
