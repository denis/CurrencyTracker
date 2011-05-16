class VisitsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_country

  # POST /countries/af/visit
  # POST /countries/af/visit.xml
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
  # DELETE /countries/af/visit.xml
  def destroy
    @visit = Visit.find_by_country_id_and_user_id @country.id, current_user.id

    if @visit
      @visit.destroy
    end

    redirect_to @country, :notice => 'Country was successfully unvisited.'
  end

  private

  def find_country
    @country = Country.find params[:country_id]
  end
end
