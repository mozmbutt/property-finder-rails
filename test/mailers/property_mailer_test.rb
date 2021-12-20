require 'test_helper'

class PropertyMailerTest < ActionMailer::TestCase
  test "property_created" do
    mail = PropertyMailer.property_created
    assert_equal "Property created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
