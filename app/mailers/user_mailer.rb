class UserMailer < ApplicationMailer
  default from: 'vlinfo@gmx.net'

  def new_registration(user)
    mail( to: user.email,
          subject: 'Welcome to Charly Gloves!')
  end

end
