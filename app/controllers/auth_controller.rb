class AuthController < ApplicationController
  def callback
    provider_user = request.env['omniauth.auth']

    user = User.find_or_create_by(provider_id: provider_user['uid'], provider_name: provider_user['provider']) do |u|
      u.provider_token = provider_user['credentials']['token']
      u.name = provider_user['info']['name']
      u.email = provider_user['info']['email']
      u.picture = provider_user['info']['image']
      u.password = 'T3mp0raryPa55word'
      u.password_confirmation = 'T3mp0raryPa55word'
    end
    user.save!

    session[:user_id] = user.id
    redirect_to root_path
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def failure
  end
end
