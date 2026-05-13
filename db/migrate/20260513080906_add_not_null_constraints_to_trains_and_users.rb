class AddNotNullConstraintsToTrainsAndUsers < ActiveRecord::Migration[8.1]
  def change
    change_column_null :trains, :manufacturer, false
    change_column_null :trains, :series, false
    change_column_null :trains, :main_operator, false
    change_column_null :trains, :user_id, false
  end
end
