class PropertyJob < ApplicationJob
  queue_as :default

  def perform(property, account)
    @property = property
    @account = account
    PropertyMailer.with(account: @account, property: @property).property_created.deliver_later
  end
end
