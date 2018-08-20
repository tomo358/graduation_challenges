class MusicalInstrumentsController < ApplicationController
  before_action :set_musical_instrument, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :show]
  before_action :share_musical_instrument, only: [:share]

  def index
    @musical_instruments = MusicalInstrument.all
  end

  def show
    @favorite = current_user.favorites.find_by(musical_instrument_id: @musical_instrument.id)
  end

  def share
    if @musical_instrument.borrower_id.present?
      @musical_instrument.update(borrower_id: "")
      redirect_to musical_instruments_path
    else
      @musical_instrument.update(borrower_id: current_user.id)
      redirect_to new_contact_path(musical_instrument_id: @musical_instrument.id)
    end
  end

  def new
    if params[:back]
      @musical_instrument = MusicalInstrument.new(musical_instrument_params)
    else
      @musical_instrument = MusicalInstrument.new
    end
  end

  def create
    @musical_instrument = MusicalInstrument.new(musical_instrument_params)
    @musical_instrument.lender_id = current_user.id
    if @musical_instrument.save
      redirect_to @musical_instrument, notice: '出品しました！'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @musical_instrument.update(musical_instrument_params)
      redirect_to @musical_instrument, notice: '内容を変更しました！'
    else
      render :edit
    end
  end

  def confirm
    @musical_instrument = MusicalInstrument.new(musical_instrument_params)
    render :new if @musical_instrument.invalid?
  end

  def destroy
    @musical_instrument.destroy
    respond_to do |format|
      format.html { redirect_to musical_instruments_url, notice: '出品を取り消しました！' }
      format.json { head :no_content }
    end
  end

  private
    def set_musical_instrument
      @musical_instrument = MusicalInstrument.find(params[:id])
    end

    def share_musical_instrument
      @musical_instrument = MusicalInstrument.find(params[:musical_instrument_id])
    end

    def musical_instrument_params
      params.require(:musical_instrument).permit(:name, :content, :image, :image_cache)
    end
end
