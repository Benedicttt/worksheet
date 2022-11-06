class Locations::LocationsController < ApplicationController
  def show
    params[:head] = "Locations work"
    render "locations/show"
  end

  def add
    params[:head] = "Add new location"

    render "locations/add"
  end

  def create
    l = Location.new
    l.name = params[:name]
    l.link = params[:link]
    l.save

    flash[:success] = "New location created"
    params[:head] = "Locations work"

    render "locations/show"
  end

  def update
    l = Location.find(params[:id_location])
    l.update!(
      name: params[:name],
      link: params[:link]
    )

    flash[:success] = "Location updated"
    params[:head] = "Locations work"

    render "locations/show"
  end

  def edit
    params[:head] = "Edit location"

    render "locations/edit", params: params
  end

  def delete
    flash[:alert] = "Location deleted"

    Location.find(params[:id]).destroy

    render "locations/show", params: params
  end
end
