# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
OrderSystem::Application.initialize!

OrderSystem::Application.configure do 
  config.action_mailer.delivery_method = :sendmail
  # config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.smtp_settings = { 
    # address: "smtp.qq.com",
    address: "smtp.gmail.com",
    # port: 25,
    port: 587,
    domain: "domain.of.sender.net", 
    authentication: "login",
    # user_name: "1871312454@qq.com", 
#     password: "jiangyanjun1314", 
    user_name: "sczy123@gmail.com",
    password: "jiangyanjun1314", 
    enable_starttls_auto: true
  }
end
