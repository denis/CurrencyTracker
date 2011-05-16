class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :visits

  def visited_countries
    visits.map { |visit| visit.country }
  end

  def not_visited_countries
    Country.all - visited_countries
  end

  def collected_currencies
    visits.map { |visit| visit.country.currencies }.flatten
  end

  def not_collected_currencies
    Currency.all - collected_currencies
  end
end
