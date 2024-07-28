
# Income and Expenditure Ratings Application - Ophelos

  

This is a rails app for the Ophelos Take Home Test.

Live Demo at:   

(User Views Styling not completed)

The task was to create a simple Income and Expenditure Application with the following features:

  

* A Customer must be able to create a I and E statement, stored in a database ✔️
* A Customer must be able to see their disposable income and rating ✔️
	* Disposable income  = Total Income - Total Expenditure ✔️
	* Ratio (for calculating the Rating) = `Total Expenditure/Total Income` ✔️
	* I&E Rating is A when 0-10%, B when 10%-30%, C when 30%-50% otherwise it's D ✔️
* Should display the disposable income and I&E rating for a statement ✔️
* Should include tests ✔️ (although more should have been done with more time available, especially view tests and end-end tests)
* Should have a form for the customer to create an I&E statement ✔️
* Should allow a customer to submit multiple I&E statements so they can report it monthly ✔️
* Should have a way to tell which person each I&E statement belongs to ✔️
* Should have at least some minimal styling ✔️
* Customers should have the ability to define their own income and expenditures ✔️
* Could have authentication (if you have time), but this is not a priority for the task. ✔️

***

#### Setup

Requirements: 
* Rails 7.0.8
* Ruby 3.2.2
* Postgresql (for database)

Basic Setup:

To run locally, clone this repo into your directory and follow the below steps:

1). In your command line run `bundle install`. 
2). In your command line run `rails db:create`. 
3). In your command line run `rails db:migrate`. 
4). In your command line run `rails s`. 
5). Navigate to `http:localhost:3000` on your browser.
6). You should be at the Login page. From here you can create a user and then login with those credentials to start using the system. 

If you require assistance, please let me know by opening an issue. 

## Future Features and Considerations

The following will need to be addressed as development moves forward:

* Add User Authorisation (CanCan Gem) so that an Admin of the app can view all Statements and Ratings for the App's users
* A dynamic select option should be added to the Income and Expenditure Name fields, so a user can more easily select from a predefined set of values 'Salary, Dividend, Other, etc...' If other is chosen, the dropdown will allow the user to input custom text. 
* More rigid end to end tests, especially for the views, using Capybara.
* Styling needs a lot of work, especially the login pages, I ran out of time to figure the problem out as to why bootstrap styling wasn't applied. 
* Stricter validation for the Statement so that only 1 can be created per month, year. So, for example, there is not 2 statements for July 2024.
* In a larger project I would consider setting this up using Github Projects (or another task-tracker) to make it easier to see what's being worked on and raise issues/bugs. 
* I would also develop new features or fix bugs on separate branches to main, and once tests pass merge back into main, ensuring the main app remains unaffected whilst new features/bugs are being worked on.

## Reflections

* I started by developing all the 'must-haves'. Once this was completed I moved onto the 'should-haves', then the could-haves.
* Styling took me than expected, it's not my strongest area and something I will work on. 
* As time pressures grew, some tests were skipped in order to prioritise getting the feature done. This isn't best practice and I should have included tests for these features (such as the search).  
* In hindsight, I should've timeboxed styling so that I had more time to focus on features, especially as styling was not a big priority. 