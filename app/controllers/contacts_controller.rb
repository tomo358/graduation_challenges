class ContactsController < ApplicationController

  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def new
    @contact = Contact.new(musical_instrument_id: params[:musical_instrument_id])
  end

  def create
    @contact = Contact.new(contact_params)
    @musical_instrument = MusicalInstrument.find(params[:contact][:musical_instrument_id])

    respond_to do |format|
      if @contact.save
        ContactMailer.contact_mail(@musical_instrument,@contact).deliver
        format.html { redirect_to @contact, notice: 'Contact was successfully created.'}
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
