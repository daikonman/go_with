require "test_helper"

class FavoriteTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael)
    @microposts = microposts(:ants)
    @favorite = @user.favorites.build(micropost_id: @microposts.id)
  end

  test "should be valid" do
    assert @favorite.valid?
  end

  test "The combination of micropost_id and user_id should be unique" do
    duplicate_favorite = @favorite.dup
    @favorite.save
    assert_not duplicate_favorite.valid?
  end
end
