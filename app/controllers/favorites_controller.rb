class FavoritesController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @favorite = current_user.favorites.create(micropost_id: params[:micropost_id])
  end

  def show
    @micropost = Micropost.find(params[:micropost_id])
    @user = User.find_by(id: @micropost.user_id)
    @favorites = Favorite.where(micropost_id: @micropost.id)
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @favorite = current_user.favorites.find_by(micropost_id: @micropost.id)
    @favorite.destroy
  end
end
