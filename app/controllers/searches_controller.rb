class SearchesController < ApplicationController
  def new

    if params[:qs].present?
      # actually do the search
      @pages = Page.search(params[:qs])
      render :results
    else
      render :new
    end
  end
end
