# == Schema Information
#
# Table name: dictionaries
#
#  id    :integer(4)      not null, primary key
#  key   :string(16)      not null
#  value :string(1024)
#

require 'test_helper'

class DictionaryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
