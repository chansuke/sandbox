require 'sinatra'
require 'httparty'
require 'json'

post '/gateway' do
  msg = params[:text].gsub(params[:trigger_world], '').strip

  action, repo = message.split('_').map {|c| c.strip.downcase }
  repo_url = "https://api.github.com/repos/#{repo}}"

  case action
    when 'issues'
      res = HTTParty.get(reop_url)
      res = JSON.parse res.body
      response_message = "#{res['open_issue_account']} open issues on #{repo}"
  end
end

def respond_message message
  content_type :json
  {:text => message }.to_json
end
