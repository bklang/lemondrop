require 'uri'

class Lemondrop::Plugin::Service
  cattr_accessor :connection

  class << self

    ##
    # Start the Redis connection with the configured database
    def start(config)
      params = config.to_hash.select { |k,v| !v.nil? }
      unless params[:uri].nil? || params[:uri].empty?
        redis_uri = URI.parse params[:uri]
        params[:user] = redis_uri.user
        params[:password] = redis_uri.password
        params[:host] = redis_uri.host
        params[:port] = redis_uri.port || params[:port]
        params.delete :uri
      end

      @@connection = establish_connection params
    end

    ##
    # Stop the database connection
    def stop
      logger.warn "Todo: Close down Redis connections"
    end

    ##
    # Start the Redis connection with the configured database
    #
    # @param params [Hash] Options to establish the database connection
    def establish_connection(params)
      ::Redis.new params
    end

  end # class << self
end # Service

