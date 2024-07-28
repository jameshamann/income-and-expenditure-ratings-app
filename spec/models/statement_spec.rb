require 'rails_helper'

RSpec.describe Statement, type: :model do
   before(:each) do
      user = User.create(id: 1, email:'test@example.com', password: 'hello1234')
    end
   it { should belong_to(:user).class_name('User') }
   it 'validates the presence of income, expenditure' do
    expect(Statement.new(month: '2024-01-01')).to_not be_valid
   end
   it 'validates the presence of month' do
    expect(Statement.new(income: {"0":{name: "Salary", value:1000.00}}, expenditure: {"0":{name: "Rent", value: 100}})).to_not be_valid
   end

   it 'validates the presence of income, expenditure and month' do
    expect(Statement.new(income: {"0":{name: "Salary", value:1000.00}}, expenditure: {"0":{name: "Rent", value: 100}}, month: '2024-04-01', user_id:1)).to be_valid
   end

   it 'calculates the total_income of the when there is a single income type' do 
      statement = Statement.create(income: {"0":{name: "Salary", value:1000.00}}, expenditure: {"0":{name: "Rent", value: 100.00}}, month: '2024-07-01',user_id:1)
      expect(statement.total_income).to eq 1000.00
     end

   it 'calculates the total_income of the income types' do 
    statement = Statement.create(income: {"0":{name: "Salary", value:1000.00},"1":{name: "Dividents", value:150.50}}, expenditure: {"0":{name: "Rent", value: 100.00},"1":{name: "Food", value: 250.43}}, month: '2024-07-01',user_id:1)
    expect(statement.total_income).to eq 1150.5
   end

   it 'calculates the total_expenditure when there is only a single expenditure' do 
      statement = Statement.create(income: {"0":{name: "Salary", value:1000.00}}, expenditure: {"0":{name: "Rent", value: 100.00}}, month: '2024-07-01',user_id:1)
      expect(statement.total_expenditure).to eq 100.00
     end

   it 'calculates the total_expenditure of the expenditure types' do 
    statement = Statement.create(income: {"0":{name: "Salary", value:1000.00},"1":{name: "Dividents", value:150.50}}, expenditure: {"0":{name: "Rent", value: 100.00},"1":{name: "Food", value: 250.43}}, month: '2024-07-01',user_id:1)
    expect(statement.total_expenditure).to eq 350.43
   end

   it 'calculates the disposable income' do 
      statement = Statement.create(income: {"0":{name: "Salary", value:1000.00}}, expenditure: {"0":{name: "Rent", value: 100.00}}, month: '2024-07-01',user_id:1)
      expect(statement.disposable_income.round(2)).to eq 900.00
     
     end

   it 'calculates the disposable income where there are more than one income types' do 
    statement = Statement.create(income: {"0":{name: "Salary", value:1000.00},"1":{name: "Dividents", value:150.50}}, expenditure: {"0":{name: "Rent", value: 100.00},"1":{name: "Food", value: 250.43}}, month: '2024-07-01',user_id:1)
    expect(statement.disposable_income.round(2)).to eq 800.07
   end

   it 'calculates the ratio percent for the rating' do 
    statement = Statement.create(income: {"0":{name: "Salary", value:1000.00},"1":{name: "Dividents", value:150.50}}, expenditure: {"0":{name: "Rent", value: 100.00},"1":{name: "Food", value: 250.43}}, month: '2024-07-01',user_id:1)
    expect(statement.ratio.round(2)).to eq 0.30
   
   end

   it 'calculates the rating' do 
    statement = Statement.create(income: {"0":{name: "Salary", value:1000.00},"1":{name: "Dividents", value:150.50}}, expenditure: {"0":{name: "Rent", value: 100.00},"1":{name: "Food", value: 250.43}}, month: '2024-07-01',user_id:1)
    expect(statement.rating).to eq "C"
   end

   end
