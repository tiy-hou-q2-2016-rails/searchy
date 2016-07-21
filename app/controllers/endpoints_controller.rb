class EndpointsController < ApplicationController
  def new
  end

  def create
    url = params[:url]

    if url =~ /\A#{URI::regexp(['http', 'https'])}\z/
      # start a job which parses, saves the URL
      ScrapeLinkJob.perform_later(url)

      render text: "Thanks! On it!", status: 200

    else
      render text: "Invalid URL YO", status: 422
    end



  end
end
