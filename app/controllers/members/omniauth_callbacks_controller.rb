class Members::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @member = Member.find_for_github_oauth(request.env["omniauth.auth"], current_member)

    if @member.persisted?
      sign_in_and_redirect @member, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_member_registration_url
    end
  end
end