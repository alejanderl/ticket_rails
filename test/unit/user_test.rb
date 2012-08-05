require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test  "no se muy bine esto para que es" do
  usuario = User.new
  assert usuario.invalid?
  assert usuario.errors[:name].any?
  assert usuario.errors[:password].any?
  assert usuario.errors[:nickname].any?          
  end
end
