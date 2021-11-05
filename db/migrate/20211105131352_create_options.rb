class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options, id: :uuid do |t|
      t.string :title, null: false
      t.references :question, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
