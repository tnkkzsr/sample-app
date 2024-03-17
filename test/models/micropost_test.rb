require "test_helper"

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @microposts = @user.microposts.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @microposts.valid?
  end

  test "user id should be present" do
    @microposts.user_id = nil
    assert_not @microposts.valid?
  end

  test "content should be present" do
    @microposts.content = "   "
    assert_not @microposts.valid?
  end

  test "content should be at most 140 characters" do
    @microposts.content = "a" * 141
    assert_not @microposts.valid?
  end

  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end
end
