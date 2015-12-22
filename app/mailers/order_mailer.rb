class OrderMailer < ActionMailer::Base
  default from: 'support@geekhub.com'
  def new_order(id)
    @id = id
    mail(to: 'admin@geekhub.com', subject: 'New order')
  end
end
