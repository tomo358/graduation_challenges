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
      redirect_to musical_instruments_path
    end
  end

  def new
    if params[:back]
      @musical_instrument = MusicalInstrument.new(musical_instrument_params)
    else
      @musical_instrument =  MusicalInstrument.new
    end
  end

  def edit
  end

  def create
    @musical_instrument = MusicalInstrument.new(musical_instrument_params)
    @musical_instrument.lender_id = current_user.id
    respond_to do |format|
      if @musical_instrument.save
        format.html { redirect_to @musical_instrument, notice: 'Musical instrument was successfully created.' }
        format.json { render :show, status: :created, location: @musical_instrument }
      else
        format.html { render :new }
        format.json { render json: @musical_instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @musical_instrument.update(musical_instrument_params)
        format.html { redirect_to @musical_instrument, notice: 'Musical instrument was successfully updated.' }
        format.json { render :show, status: :ok, location: @musical_instrument }
      else
        format.html { render :edit }
        format.json { render json: @musical_instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
    @musical_instrument = MusicalInstrument.new(musical_instrument_params)
    render :new if @musical_instrument.invalid?
  end

  def destroy
    @musical_instrument.destroy
    respond_to do |format|
      format.html { redirect_to musical_instruments_url, notice: 'Musical instrument was successfully destroyed.' }
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
