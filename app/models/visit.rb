class Visit < ActiveRecord::Base
  belongs_to :country
  belongs_to :user
end
