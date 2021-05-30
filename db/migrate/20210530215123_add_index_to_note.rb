class AddIndexToNote < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :index, :integer
  end
end
