class ContactMailer < ApplicationMailer
  def contact_mail(musical_instrument, contact, current_user)
    @musical_instrument = musical_instrument
    @contact = contact
    @current_user = current_user

    mail to: @musical_instrument.lender.email, subject: "お問い合わせの確認メール"
  end
end
