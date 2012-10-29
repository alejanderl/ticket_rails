class Administrator < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_administrators
  belongs_to :resource, :polymorphic => true
  
  scopify
end
