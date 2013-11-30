module Lemondrop
  class << self
    def method_missing(meth, *args, &blk)
      if Lemondrop::Plugin::Service.connection && Lemondrop::Plugin::Service.connection.respond_to?(meth)
        Lemondrop::Plugin::Service.connection.send meth, *args, &blk
      else
        super
      end
    end
  end
end
