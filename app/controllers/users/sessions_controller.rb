class Users::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    puts "Parameters received: #{params.inspect}"
    super
  end
end
