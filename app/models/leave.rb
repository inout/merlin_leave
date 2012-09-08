class Leave < ActiveRecord::Base
  attr_accessible :approved_on, :approver_id, :leave_notes, :leave_type, :requested_on, :requestor_id
end
