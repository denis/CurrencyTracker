class Visit < ActiveRecord::Base
  belongs_to :country
  belongs_to :user

  def currency
    country.currencies.first
  end
end
