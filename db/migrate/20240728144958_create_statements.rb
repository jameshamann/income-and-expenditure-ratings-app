class CreateStatements < ActiveRecord::Migration[7.0]
  def change
    create_table :statements do |t|
      t.jsonb :income
      t.jsonb :expenditure
      t.float :total_income
      t.float :total_expenditure
      t.float :disposable_income
      t.float :ratio
      t.string :rating
      t.date :month
      t.timestamps
    end
  end
end
