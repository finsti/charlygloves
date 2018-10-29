class UserMailer < ApplicationMailer
  default from: 'vlinfo@gmx.net'

  def new_registration(user)
    mail(to: user.email,
         subject: 'Welcome to Charly Gloves!')
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(from: @email,
      to: 'vlinfo@gmx.net',
      subject: "A new contact form message from #{@name}",
      body: @message).deliver_now
  end

  def order_placed(user, product)
    @user = user
    @product = product
    mail(to: user.email,
         subject: "Thank you for your order!")
  end

end
