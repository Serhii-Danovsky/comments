class Comment < ActiveRecord::Base
  attr_accessible :body
  belongs_to :commentable, :polymorphic => true     
  has_many :comments, :as => :commentable
end