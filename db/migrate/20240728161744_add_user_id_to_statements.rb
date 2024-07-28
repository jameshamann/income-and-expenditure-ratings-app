class AddUserIdToStatements < ActiveRecord::Migration[7.0]
  def change
    add_column :statements, :user_id, :integer
  end
end
