require 'redis-namespace'

class Lemondrop::Plugin < Adhearsion::Plugin
  extend ActiveSupport::Autoload

  autoload :Service, 'lemondrop/plugin/service'

  # Configure the connection information to your Redis instance.
  config :lemondrop do
    uri         ''         , :desc => 'URI to the Redis instance. Use this or specify each piece of connection information separately below.'
    username    ''         , :desc => 'valid database username'
    password    nil        , :desc => 'valid database password'
    host        'localhost', :desc => 'host where the database is running'
    port        6379       , :desc => 'port where the database is listening'
    socket      ''         , :desc => 'path to Unix socket where Redis is listening (Optional; to use, set host and port to nil)'
    namespace   ''         , :desc => 'namespace to prefix to all keys'
  end

  init :lemondrop do
    Service.start Adhearsion.config[:lemondrop]
  end
end
