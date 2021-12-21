class PropertyMailer < ApplicationMailer
  default from: 'moazzam.ali@devsinc.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.property_mailer.property_created.subject
  #
  def property_created
    @greeting = 'Hi'
    @account = params[:account]
    @property = params[:property]
    photo = params[:property].photo
    attachments[photo.filename.to_s] = photo.download

    mail(
      to: @account.email,
      cc: 'mozmbutt8@gmail.com',
      subject: 'New Post Created'
    )
  end
end
