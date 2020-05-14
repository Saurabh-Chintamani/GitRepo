
/*
1. CreateInspectionJob flow diagram
*/


/* Scenarios for Inspection Admin login */
@AdminLogin
Feature: User Authentication 

    Scenario: Valid user tries to login to the system
        Given the user is on the login page
        When the user inputs the correct Username
        And the user inputs the correct password
        And the user clicks the Login button
        Then the user should be authenticated
        And the user should be redirected to the dashboard page
        And the user should be presented with a success message 

    Scenario: Invalid user tries to login to the system
        Given the user is on the login page
        When the user inputs the incorrect Username
        And the user inputs the incorrect password
        And the user clicks the Login button
        Then the user should be authenticated
        And the user should be restricted to login
        And the user should be presented with appropriate error message 


/* Scenarios for  Create Job*/
@CreateJob
Feature: Job Creation

    Scenario: Create job using valid data inputs
        Given the user is on the Create job page
        When the user inputs valid data in all mandatory fields like customer name, mobile number etc.
        And the user inputs valid data in all non mandatory fields like Alternate number, Flat no, state etc.
        And the user clicks the Create job button
        Then the user should be presented with a success message
        And the user should be redirected to the dashboard page

    Scenario: Create job using invalid data inputs in all mandatory fields
        Given the user is on the Create job page
        When the user inputs invalid data in all mandatory fields like customer name, mobile number etc.
        And the user inputs valid data in all non mandatory fields like Alternate number, Flat no, state etc.
        And the user clicks the Create job button
        Then the user should be presented with a error message and job should not get created.
        And the user should stay on the create job page

    Scenario: Create job using invalid data inputs in all non mandatory fields
        Given the user is on the Create job page
        When the user inputs valid data in all mandatory fields like customer name, mobile number etc.
        And the user inputs invalid data in all non mandatory fields like Alternate number, Flat no, state etc.
        And the user clicks the Create job button
        Then the user should be presented with a error message and job should not get created.
        And the user should stay on the create job page

    Scenario: Create job using blank data inputs in all fields
        Given the user is on the Create job page
        When the user don't inputs data in all fields.
        And the user clicks the Create job button
        Then the user should be presented with a error message and job should not get created.
        And the user should stay on the create job page


/* Scenarios for Assign job to scheduling clerk*/
@AssignJobToSchedulingClerk
Feature: Job Assignment to scheduling clerk

    Scenario: Assign a job to single scheduling clerk
        Given the user is on the Available job page
        When the user selects a job from given list
        And the user selects a scheduling clerk
        And the user clicks the Assign Job button
        Then the user should be presented with a success message
        And the user should be redirected to the Available Jobs page

    Scenario: Assign a job to multiple scheduling clerks
        Given the user is on the Available job page
        When the user selects a job from given list
        And the user selects multiple scheduling clerks
        And the user clicks the Assign Job button
        Then the user should be presented with a error message
        And the user should be redirected to the Available Jobs page

    Scenario: Assign multiple jobs to single scheduling clerk
        Given the user is on the Available job page
        When the user selects multiple jobs from given list
        And the user selects a scheduling clerk
        And the user clicks the Assign Job button
        Then the user should be presented with a success message
        And the user should be redirected to the Available Jobs page

    Scenario: Assign multiple jobs to multiple scheduling clerk
        Given the user is on the Available job page
        When the user selects multiple jobs from given list
        And the user selects multiple scheduling clerks
        And the user clicks the Assign Job button
        Then the user should be presented with a error message
        And the user should be redirected to the Available Jobs page

    Scenario: Reject job by scheduling clerk
        Given the user is on the Available job page
        When the user gets reject response from scheduling clerk
        Then the user should be able to reassign job to other scheduling clerk
        And the user should be presented with a success message
        And the user should be redirected to the Available Jobs page
