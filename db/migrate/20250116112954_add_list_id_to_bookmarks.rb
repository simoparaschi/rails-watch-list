class AddListIdToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_column :bookmarks, :list_id, :integer
  end
end
