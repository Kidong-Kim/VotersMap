# frozen_string_literal: true

class RepresentativesController < ApplicationController
  def index
    @representatives = Representative.all
  end

  def show
    id = params[:representative_id] # retrieve representative ID from URI route
    @representatives = Representative.find(id) # look up representative by unique ID
    # will render app/views/representatives/show.<extension> by default
  end
end
