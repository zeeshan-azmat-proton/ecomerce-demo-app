ActionMailer::Base.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  user_name:            'zeeshan.azmat.proton@gmail.com',
  password:             'zeeshan123',
  authentication:       'plain',
  enable_starttls_auto: true
}