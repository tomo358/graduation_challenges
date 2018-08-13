class ContactMailer < ApplicationMailer
  def contact_mail(musical_instrument, contact, current_user)
    @musical_instrument = musical_instrument
    @contact = contact
    @current_user = current_user

    if @current_user.id == @musical_instrument.lender.id
      mail to: @musical_instrument.borrower.email, subject: "お問い合わせの確認メール"
    else
      mail to: @musical_instrument.lender.email, subject: "お問い合わせの確認メール"
    end
  end
end
