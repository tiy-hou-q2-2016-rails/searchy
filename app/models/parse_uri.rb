require 'mechanize'

class ParseUri

  attr_reader :uri, :page_text, :page_title, :links

  def initialize(uri)
    @uri = uri
  end

  def parse

    a = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }

    a.get(@uri) do |page|

      @page_text = page.search("body").text

      @page_title = page.title
      @page_uri = page.uri.to_s

      @links = []

      page.links.each do |link|

        next if link.href.nil?

        if link.href.starts_with? "http"
          @links << link.href
        else

          url = URI.parse(@page_uri)
          @links << [url.scheme, "://", url.hostname, link.href].join

        end


      end
    end

  end

  def save

    Page.where(uri: @uri).first_or_create({
      content: @page_text,
      title: @page_title
      })

  end
end
