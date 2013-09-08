require 'test_helper'

class AthleteTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Athlete.new.valid?
  end
end
