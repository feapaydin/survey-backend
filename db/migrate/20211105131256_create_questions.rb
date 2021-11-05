class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions, id: :uuid do |t|
      t.string :title, null: false
      t.integer :type, default: 0
      t.references :survey, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
