if Rails.env == "development"
  ActiveMerchant::Billing::FirstdataE4Gateway.wiredump_device = File.open(Rails.root.join("log","active_merchant.log"), "a+")  
  ActiveMerchant::Billing::FirstdataE4Gateway.wiredump_device.sync = true 
  ActiveMerchant::Billing::Base.mode = :test

  login = "SD6775-34"
  password="O4LFdIPKelbbUzW16vRj0JxvZ5qspHRW"
elsif Rails.env == "production"
  login = 'SD6775-34'
  password='O4LFdIPKelbbUzW16vRj0JxvZ5qspHRW'
end
GATEWAY = ActiveMerchant::Billing::FirstdataE4Gateway.new({
      login: login,
      password: password
})