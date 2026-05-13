class AddTrainsIndexes < ActiveRecord::Migration[8.1]
  def change
    # Replace the single-column user_id index with a composite that also covers
    # ordered user-scoped queries (e.g. a future profile page)
    remove_index :trains, :user_id
    add_index :trains, [:user_id, :created_at]

    # Needed for TrainsController#index which orders by created_at: :desc
    add_index :trains, :created_at
  end
end
