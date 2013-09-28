require 'test_helper'

class PollAnswerTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PollAnswer.new.valid?
  end
end
