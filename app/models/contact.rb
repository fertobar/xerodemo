class Contact < ActiveRecord::Base
  validate :name, :presence => true
  validate :first_name, :presence => true

  validate :last_name, :presence => true

  validate :email_address, :presence => true, :uniqueness => true


  def self.synchronize(xero_client)
    contacts = xero_client.Contact.all(:order => 'Name')
    emails_list = []
    contacts.entries.each do |contact|
      #try to find by guid
      local_contact = Contact.find_by_xero_uid(contact.contact_id)
      if !local_contact
        #try to find by email
        local_contact = Contact.find_by_email_address(contact.email_address)
        if !local_contact
          #create a new one
          Contact.create!(:name => contact.name, :first_name => contact.first_name, :last_name => contact.last_name, :xero_uid => contact.contact_id, :email_address => contact.email_address)
        end
      end
    end
  end

end
