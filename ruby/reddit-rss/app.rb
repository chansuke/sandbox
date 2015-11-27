require 'sinatra'
require 'feedlizer'
require 'time'
require 'kconv'
require 'slim'

get '/' do
  slim :index
end

get '/new' do
  begin
    rss = feedalize('https://www.reddit.com/new/') do
      feed.title = 'Reddit news'
      feed.description = 'Reddit news'

      scrape_items('div.section') do |rss_item, html_element|
        link = html_element.xpath('a').first

        rss_item.link  = link.get('href')
        rss_item.title = link.inner_text.toutf8
        rss_item.description = html_element.inner_text.toutf8
      end
    end
    content_type :rss
    rss.output
  rescue => e
    "Error"
  end
end
