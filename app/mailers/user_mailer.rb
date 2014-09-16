class UserMailer < ActionMailer::Base
  # default from: "zeeshan.azmat.proton@gmail.com"

  def registration_confirmation()
    mail(to: "zeeshanazmat56@gmail.com", subject: "registered", from: "zeeshan.azmat.proton@gmail.com")
  end


end
