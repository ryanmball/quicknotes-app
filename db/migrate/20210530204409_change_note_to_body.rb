class ChangeNoteToBody < ActiveRecord::Migration[6.1]
  def change
    rename_column :notes, :note, :body
  end
end
