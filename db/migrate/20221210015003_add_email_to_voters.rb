class AddEmailToVoters < ActiveRecord::Migration[7.0]
  def change
    add_column :voters, :email, :string
  end
end
