class ScrapeLinkJob < ApplicationJob
  queue_as :default

  # # run this job right now
  # ScrapeLinkJob.set(wait: 5.minutes).perform_now("http://www.yolo.example.com")
  # # run this job in minutes
  # ScrapeLinkJob.set(wait: 5.minutes).perform_later("http://www.yolo.example.com")
  # # run this job at some point when you can
  # ScrapeLinkJob.perform_later("http://www.yolo.example.com")

  def perform(uri)

    puts "Scraping #{uri}"

    p = ParseUri.new(uri)
    p.parse
    p.save

    p.links.each do |link|
      ScrapeLinkJob.perform_later(link)
    end

  end
end
