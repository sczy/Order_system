# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
OrderSystem::Application.initialize!

OrderSystem::Application.configure do 
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = { 
    address: "smtp.qq.com",
    port: 25,
    domain: "domain.of.sender.net", 
    authentication: "login",
    user_name: "1871312454@qq.com", 
    password: "jiangyanjun1314", 
    enable_starttls_auto: true
  }
end
