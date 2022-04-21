require 'elasticsearch'
require 'faraday_middleware/aws_sigv4'

class ElasticSearchCustom
  def call
    full_url_and_port = 'https://search-movies-2lvzbc5xzzj3ldxl5lrny6e7w4.us-east-1.es.amazonaws.com:443' # e.g. https://my-domain.region.es.amazonaws.com:443
    index = 'ruby-index'
    type = '_doc'
    id = '1'
    document = {
      year: 2007,
      title: '5 Centimeters per Second',
      info: {
        plot: 'Told in three interconnected segments, we follow a young man named Takaki through his life.',
        rating: 7.7
      }
    }

    region = 'us-east-1' # e.g. us-west-1
    service = 'es'

    client = Elasticsearch::Client.new(url: full_url_and_port) do |f|
      f.request :aws_sigv4,
        service: service,
        region: region,
        access_key_id: 'AKIAVYRWVVBNU4EFSHV2',
        secret_access_key: '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'
        # session_token: ENV['AWS_SESSION_TOKEN'] # optional
    end

    puts client.index index: index, type: type, id: id, body: document
  end
end