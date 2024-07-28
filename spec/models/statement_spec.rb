require 'rails_helper'

RSpec.describe Statement, type: :model do
   it 'validates the presence of income, expenditure' do
    expect(Statement.new(month: '2024-01-01')).to_not be_valid
   end
   it 'validates the presence of month' do
    expect(Statement.new(income: {"0":{name: "Salary", value:1000.00}}, expenditure: {"0":{name: "Rent", value: 100}})).to_not be_valid
   end

   it 'validates the presence of income, expenditure and month' do
    expect(Statement.new(income: {"0":{name: "Salary", value:1000.00}}, expenditure: {"0":{name: "Rent", value: 100}}, month: '2024-04-01')).to be_valid
   end

   it 'calculates the total_income of the income types' do 
    statement = Statement.create(income: {"0":{name: "Salary", value:1000.00},"1":{name: "Dividents", value:150.50}}, expenditure: {"0":{name: "Rent", value: 100.00},"1":{name: "Food", value: 250.43}}, month: '2024-07-01')
    expect(statement.total_income).to eq 1150.5
   end

   it 'calculates the total_expenditure of the income types' do 
    statement = Statement.create(income: {"0":{name: "Salary", value:1000.00},"1":{name: "Dividents", value:150.50}}, expenditure: {"0":{name: "Rent", value: 100.00},"1":{name: "Food", value: 250.43}}, month: '2024-07-01')
    expect(statement.total_expenditure).to eq 350.43
   end
end
