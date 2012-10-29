class AddressController < ApplicationController
  
  load_and_authorize_resource
  autocomplete :city, :name, :full => true

end
