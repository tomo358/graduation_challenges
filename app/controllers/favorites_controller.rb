class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(musical_instrument_id: params[:musical_instrument_id])
    redirect_to musical_instruments_url
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to musical_instruments_url
  end
end
