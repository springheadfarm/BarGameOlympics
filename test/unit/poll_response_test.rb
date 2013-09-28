require 'test_helper'

class PollResponseTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PollResponse.new.valid?
  end
end
