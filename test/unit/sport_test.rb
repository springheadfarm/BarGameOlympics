require 'test_helper'

class SportTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Sport.new.valid?
  end
end
