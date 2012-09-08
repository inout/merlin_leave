Given /^The user with email "(.*?)" exists$/ do |email_address|
  FactoryGirl.build(:user, email: email_address).save(:validate => false)
end

Given /^The latest attendance entry for this user was a "(.*?)" entry on "(.*?)"$/ do |entry_type, entry_date|
  puts "TODO: Handle _working_ day"
  User.count.should == 1
  entry_type_trait = nil

  if entry_date == 'previous working day'
    case entry_type
    when 'Start time but no End time'
      entry_type_trait = :previous_day_in_but_no_out
    when 'End time but no Start time'
      entry_type_trait = :previous_day_out_but_no_in
    when 'Start time and an End time'
      entry_type_trait = :previous_day_in_and_out
    end
  elsif entry_date == 'current working day'
    case entry_type
    when 'Start time but no End time'
      entry_type_trait = :today_in_but_no_out
    when 'End time but no Start time'
      entry_type_trait = :today_out_but_no_in
    when 'Start time and an End time'
      entry_type_trait = :today_in_and_out
    end
  end

  FactoryGirl.create(entry_type_trait, user: User.first)
end

When /^the login script is executed for this user at the current time$/ do
  Timecop.freeze(Time.now)
  puts "TODO: Execute the login script for real!!!!"
  puts "current_time = #{Time.now}"
  FactoryGirl.create(:attendance, time_in: Time.now, user: User.first) #freshly created attendance for today
end

Then /^An attendance entry should be created for this user with the current time as the time in$/ do
  Attendance.count.should == 2
  Attendance.find_by_time_in(Time.now).should_not be_nil
end

Then /^This user should be sent an email asking him to enter the end time on the pervious working day$/ do
  puts "TODO:\n>>> This is where the user will be sent an email asking him to enter the end time on the previous workind day. >>>"
end

