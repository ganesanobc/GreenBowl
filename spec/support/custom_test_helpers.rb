def dputs(message)
  Rails.logger.info(message)
  puts ">>>"
  puts message
  puts "<<<"
end

def sign_in_as(user)
  fill_in "customer_email", with:user.email
  fill_in "customer_password", with:user.password
  click_button "Log in"
  sign_in user
end
