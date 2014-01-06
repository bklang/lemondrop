require 'uri'

class Lemondrop::Plugin::Service
  cattr_accessor :connection

  class << self

    ##
    # Start the Redis connection with the configured database
    def start(config)
      params = config.to_hash.select { |k,v| !v.nil? }
      unless params[:uri].nil? || params[:uri].empty?
        uri = URI.parse params[:uri]
        params[:username] = uri.user
        params[:password] = uri.password
        params[:hostname] = uri.hostname
        params[:port] = uri.port || params[:port]
        params.delete :uri
      end

      @@connection = establish_connection params
    end

    ##
    # Stop the redis connection
    def stop
      logger.warn "Todo: Close down Redis connections"
    end

    ##
    # Start the connection to the configured Redis server
    #
    # @param params [Hash] Options to establish the Redis connection
    def establish_connection(params)
      connection = ::Redis.new params
      logger.info "Lemondrop connected to Redis at #{params[:host]}:#{params[:port]}"
      connection
    end
  end # class << self
end # Service

