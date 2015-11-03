require 'test_helper'

class CommentTest < ActiveSupport::TestCase
	test "comment_test" do
		user = FactoryGirl.create(:user)
		place = FactoryGirl.create(:place)
		comment = FactoryGirl.create(:comment)

		expected = 'five stars'
		actual = comment.humanized_rating
		assert_equal expected, actual
	end
end