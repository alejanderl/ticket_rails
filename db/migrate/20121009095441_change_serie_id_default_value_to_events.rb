class ChangeSerieIdDefaultValueToEvents < ActiveRecord::Migration
  def up
    
    change_column :events, :serie_id , :integer, :default => 0
    
  end

 
end
