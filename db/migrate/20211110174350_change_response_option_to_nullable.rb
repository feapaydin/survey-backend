class ChangeResponseOptionToNullable < ActiveRecord::Migration[6.1]
  def change
    change_column_null :responses, :option_id, true
  end
end
