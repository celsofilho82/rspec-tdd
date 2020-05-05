require 'spec_helper'

describe "HTTParty" do

  # it "content-type" do
  #   response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
  #   content_type = response.headers['content-type']
  #   expect(content_type).to match(/application\/json/)  
  # end

  # it "webmock test" do
  #   stub_request(:get, "https://jsonplaceholder.typicode.com/posts/2").to_return(status: 200, body:"", headers: { 'content-type': 'application/json' })
  #   response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
  #   content_type = response.headers['content-type']
  #   expect(content_type).to match(/application\/json/)  
  # end

  it "VCR Test" do
    VCR.use_cassette("jsonplaceholder/posts") do
      response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
      content_type = response.headers['content-type']
      expect(content_type).to match(/application\/json/)
    end
  end

  it "VCR RSpec metadata", :vcr do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end

  # Neste exemplo estou indicando o cassete que quero utilizar no vcr metadata
  it "VCR RSpec metadata indicando o cassette", vcr: { cassette_name: 'jsonplaceholder/posts' } do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/2')
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end

  # Neste exemplo estou verificando o cassette pelo corpo da requisição e não pelo conjunto verbo http e url
  it "VCR RSpec URIs não determinísticas", vcr: { cassette_name: 'jsonplaceholder/posts', match_requests_on: [:body] } do
    response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/3')
    content_type = response.headers['content-type']
    expect(content_type).to match(/application\/json/)
  end

  
end
