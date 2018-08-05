class ContactMailer < ApplicationMailer
  def contact_mail(musical_instrument, contact)
    @musical_instrument = musical_instrument
    @contact = contact
    mail to: @musical_instrument.lender.email, subject: "お問い合わせの確認メール"
  end
end
