class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def new
    if  params[:musical_instrument_id].present?
      @contact = Contact.new(musical_instrument_id: params[:musical_instrument_id])
    else
      @contact = Contact.new(musical_instrument_id: params[:format])
    end
  end

  def create
    @contact = Contact.new(contact_params)
    @musical_instrument = MusicalInstrument.find(params[:contact][:musical_instrument_id])
    @current_user = current_user

    respond_to do |format|
      if @contact.save
        ContactMailer.contact_mail(@musical_instrument,@contact,@current_user).deliver
        format.html { redirect_to @contact, notice: 'お問い合わせを完了しました！'}
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private
  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:title, :content, :musical_instrument_id)
  end
end
