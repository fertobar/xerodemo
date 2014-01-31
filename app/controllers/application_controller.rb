class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private

  def get_xero_client
    $xero_client = Xeroizer::PublicApplication.new(APP_CONFIG['OAUTH_CONSUMER_KEY'],APP_CONFIG['OAUTH_CONSUMER_SECRET'])

    # Add AccessToken if authorised previously.
    if session[:xero_auth]
      $xero_client.authorize_from_access(
          session[:xero_auth][:access_token],
          session[:xero_auth][:access_key] )
    end
  end
end
