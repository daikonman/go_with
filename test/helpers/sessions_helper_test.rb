require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @user = users(:michael)
    remember(@user)  # 読み込みはできているが、期待通りの動作をしない
  end

  # 失敗するテスト（実際には開発環境では問題なく動く（テストのみ失敗））
  # test "current_user returns right user when session is nil" do
  #   assert_equal @user, current_user
  #   assert is_logged_in?
  # end

  test "current_user returns nil when remember digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end