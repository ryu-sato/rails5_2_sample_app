# == Schema Information
#
# Table name: tickets
#
#  id           :integer          not null, primary key
#  code         :string           not null
#  lock_version :integer          default(0)
#  host_id      :integer
#
# Indexes
#
#  index_tickets_on_host_id  (host_id)
#

require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
