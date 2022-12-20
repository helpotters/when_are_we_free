class AddMinimumToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :minimum, :integer
  end
end
