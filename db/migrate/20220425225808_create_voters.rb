class CreateVoters < ActiveRecord::Migration[7.0]
  def change
    create_table :voters do |t|
      t.text :name
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
