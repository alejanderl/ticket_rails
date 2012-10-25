class AddressController < ApplicationController
  
  
  autocomplete :city, :name, :full => true

end
