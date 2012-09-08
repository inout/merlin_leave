Feature: Start time
  Executing a login script (.sh or .bat file) should record the
  user's start time for the day. If the user has failed to record End time on the previous
  working day it should also send a notification to the user to update it.

  Scenario: User seen for the first time today, did not log out on previous working day
    Given The user with email "test@user.one" exists
    And The latest attendance entry for this user was a "Start time but no End time" entry on "previous working day"
    When the login script is executed for this user at the current time
    Then An attendance entry should be created for this user with the current time as the time in
    And This user should be sent an email asking him to enter the end time on the pervious working day

  Scenario: User seen for the first time today, did log out properly on a previous working day
    Given The user with email "test@user.one" exists
    And The latest attendance entry for this user was a "Start time and an End time" entry on "previous working day"
    When the login script is executed for this user at the current time
    Then An attendance entry should be created for this user with the current time as the time in

    #Feature: Start time
    #Executing a login script (.sh or .bat file) should record the
    #user's start time for the day. If the user has failed to record End time on the previous
    #working day it should also send a notification to the user to update it.
    #
    #Scenario: User seen for the first time today, did not log out on previous working day
    #Given The user (identified by user id in the login script) exists
    #And The entry for this user was a Start time entry on a previous working day
    #When The login script is executed
    #Then The user's start time should be recorded as the current date and time
    #And The user should be sent an email asking to enter the end time for the previous working day
    #
    #Scenario: User seen for the first time today, did log out properly on a previous working day
    #Given The user (identified by user id in the login script) exists
    #And The latest entry for this user was an End time entry on a previous working day
    #When The login script is executed
    #Then The user's start time is recorded as the current date and time
    #
    #Scenario: User seen for a second time today and has logged out last time
    #Given The user (identified by user id in the login script) exists
    #And One Start time and one End time entry exists for this user is on today's date
    #When The login script is executed
    #Then Record a new start time equal to current date and time for this user
    #
    #Scenario: User seen for a second time today but did not log out last time
    #Given The user (identified by user id in the login script) exists
    #And One Start time entry exists for this user is on today's date
    #And No End time is recorded for this user on today's date
    #When The login script is executed
    #Then Make no entry for this user - assume continuation of her work for the day
    #
    #Scenario: Someone attempts to create a start time that is greater than the end time for the same day
    #Given An attempt is made to record a start time for a user
    #And An end time entry already exists for this user for the current day before the given start time
    #When The start time save is called
    #Then Throw an exception saying Start time cannot be greater than End time
    #
    #Scenario: Someone is ignoring updating their login and logout times - Yellow
    #Given The user (identified by user id in the login script) exists
    #And The system has at least 10 entries for this user
    #And Out of the user's last 10 entries there aren't exactly 5 "Time In" and 5 "Time Out" entries
    #When the login script is executed
    #Then The user's "time compliance status" should be set to "Yellow"
    #And An email should be sent to the user notifying that their compliance level has dropped to "Yellow" and that they should fix it soon.
    #
    #Scenario: Someone is repeatedly ignoring updating their login and logout times - Red
    #Given The user (identified by user id in the login script) exists
    #And The system has at least 20 entries for this user
    #And Out of the user's last 20 entries if there aren't exactly 10 "Time In" and 10 "Time Out" entries
    #When the login script is executed
    #Then The user's "time compliance status" should be set to "Red"
    #And An email should be sent to the user and their manager of the poor time compliance
