class AddUniqueConstraint < ActiveRecord::Migration
  def change
    add_index :subs, :title, unique: true
  end
end
