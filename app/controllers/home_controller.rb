class HomeController < ApplicationController
  def index

    if session[:xero_auth] && $xero_client
      begin
        @contacts = $xero_client.Contact.all(:order => 'Name')
      rescue
        #expired session
        session[:xero_auth] = nil
        $xero_client = nil
      end
    else
      @contacts = []
    end

    #eg. update contact
    #contact = $xero_client.Contact.find("8644bfcd-17ed-47f7-a852-a5fce2d64cdb")
    #contact.name = "Another Name Change"
    #contact.save

  end
end
