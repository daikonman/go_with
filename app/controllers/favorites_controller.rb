class FavoritesController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @favorite = current_user.favorites.create(micropost_id: params[:micropost_id])
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @favorite = current_user.favorites.find_by(micropost_id: @micropost.id)
    @favorite.destroy
  end
end
