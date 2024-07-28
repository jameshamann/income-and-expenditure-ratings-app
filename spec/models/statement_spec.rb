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
end
