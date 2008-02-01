require 'webrick'
require 'rack/handler/webrick'

# DOC: Ezra Zygmuntowicz FAILED
module Merb

  # DOC: Ezra Zygmuntowicz FAILED
  module Rack

    # DOC: Ezra Zygmuntowicz FAILED
    class WEBrick
      # start WEBrick server on given host and port.

      # DOC: Ezra Zygmuntowicz FAILED
      def self.start(opts={})
        options = {
          :Port        => opts[:port],
          :BindAddress => opts[:host],
          :Logger      => Merb.logger,
          :AccessLog   => [
            [Merb.logger, ::WEBrick::AccessLog::COMMON_LOG_FORMAT],
            [Merb.logger, ::WEBrick::AccessLog::REFERER_LOG_FORMAT]
          ]
        }
     
        server = ::WEBrick::HTTPServer.new(options)
        server.mount("/", ::Rack::Handler::WEBrick, opts[:app])
        server.start
      end
    end
  end
end