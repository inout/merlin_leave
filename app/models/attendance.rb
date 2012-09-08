class Attendance < ActiveRecord::Base
  attr_accessible :time_in, :time_out, :user_id
  belongs_to :user
end
