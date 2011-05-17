class VisitsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_country, :only => [:create, :destroy]

  # POST /countries/af/visit
  def create
    if @country.visited_by?(current_user)
      redirect_to @country, :notice => 'Country is already visited.'
    end

    @visit = Visit.new do |v|
      v.country = @country
      v.user = current_user
    end

    if @visit.save
      redirect_to @country, :notice => 'Country was successfully visited.'
    else
      redirect_to @country, :notice => 'Country was not visited.'
    end
  end

  # DELETE /countries/af/visit
  def destroy
    @visit = Visit.find_by_country_id_and_user_id @country.id, current_user.id

    if @visit
      @visit.destroy
    end

    redirect_to @country, :notice => 'Country was successfully unvisited.'
  end

  # POST /visits/create_multiple
  def create_multiple
    params[:country_codes].each do |code|
      Visit.create :country => Country.find(code), :user => current_user
    end

    redirect_to :back
  end

  private

  def find_country
    @country = Country.find params[:country_id]
  end
end
