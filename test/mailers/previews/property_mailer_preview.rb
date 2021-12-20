# Preview all emails at http://localhost:3000/rails/mailers/property_mailer
class PropertyMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/property_mailer/property_created
  def property_created
    PropertyMailer.with(account: Account.first, property: Property.last).property_created
  end

end
