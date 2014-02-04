class Contact < ActiveRecord::Base
  validate :name, :presence => true
  validate :first_name, :presence => true

  validate :last_name, :presence => true

  validate :email_address, :presence => true, :uniqueness => true


end
