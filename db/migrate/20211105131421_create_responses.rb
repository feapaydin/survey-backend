class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses, id: :uuid do |t|
      t.references :question, null: false, foreign_key: true, type: :uuid
      t.text :body
      t.references :option, null: false, foreign_key: true, type: :uuid
      t.references :feedback, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
