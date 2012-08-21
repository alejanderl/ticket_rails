class Addcinemaidtoaddresses < ActiveRecord::Migration
def change
  add_column :addresses, :cinema_id, :integer
end

end
