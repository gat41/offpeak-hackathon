 class SessionsController < Clearance::SessionsController

      def create_from_omniauth
        auth_hash = request.env["omniauth.auth"]
        authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
        if authentication.user
          user = authentication.user 
          authentication.update_token(auth_hash)
          @next = root_url
          flash[:info] = "Thank you for signing up with Offpeak. We are giving you 10 chomps to say thank you. Get more chomps and your next meal will be on us!"
        else
          user = User.create_with_auth_and_hash(authentication,auth_hash)
          @next = edit_user_path(user)   
          @notice = "User created - confirm or edit details..."
        end
        sign_in(user)
        redirect_to @next
      end
    end