class CustomFailure < Devise::FailureApp
    require 'pry'
    def redirect_url
       new_user_session_url(:subdomain => 'secure')
    end

    # You need to override respond to eliminate recall
    def respond
      binding.pry
      if http_auth?
        http_auth
      else
        redirect
      end
    end

    def redirect
      store_location!
      if is_flashing_format?
        if flash[:timedout] && flash[:alert]
          flash.keep(:timedout)
          flash.keep(:alert)
        else
          flash[:alert] = i18n_message
        end
      end
      redirect_to(:back)
    end
end