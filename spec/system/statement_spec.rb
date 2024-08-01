

require 'rails_helper'

RSpec.describe "user can create a statement" do 

    before(:each)do
    user = User.create(id:1, email: "j@j.com", password: "123456")
    sign_in user
    end

        it "should not alow a user to save a zero value" do 
            visit "/statements/new"
            fill_in "Month", with: "2024-07-01"
            fill_in "Income Name", with: "Salary"
            fill_in "Expenditure Name", with: "Rent"
            fill_in "Expenditure Value", with: 500
            click_button "Save Statement"
            expect(page).to have_content("Income Value must be greater than 0.")
        end

        it "should not alow a user to save a zero value" do 
            visit "/statements/new"
            fill_in "Month", with: "2024-07-01"
            fill_in "Income Name", with: "Salary"
            fill_in "Income Value", with: 500
            fill_in "Expenditure Name", with: "Rent"
            click_button "Save Statement"
            expect(page).to have_content("Expenditure Value must be greater than 0.")
        end

end
