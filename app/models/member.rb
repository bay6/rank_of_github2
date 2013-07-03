class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:github]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :name

  # attr_accessible :title, :body
  def self.find_for_github_oauth(auth, signed_in_resource=nil)
    member = Member.where(:provider => auth.provider, :uid => auth.uid).first
    unless member
      member = Member.create(name:auth.extra.raw_info.login, # changed from name to login in case some one has no name 
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
                        )
    end
    member
  end

  def self.new_with_session(params, session)
    super.tap do |member|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        member.email = data["email"] if member.email.blank?
      end
    end
  end

end
