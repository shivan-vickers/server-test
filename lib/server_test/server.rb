module ServerTest
  class Server
    def initialize(port = 8080)
      @server = WEBrick::HTTPServer.new Port: port

      @server.mount_proc '/' do |req, res|
        if open(req.body)
          res.body = 'Opened it!'
        else
          res.body = "Couldn't find that file D:"
        end
      end
    end

    def start
      @server.start
    end

    def open(filename)
      target = Shortcut.new(filename)

      system "start #{target}"
    end
  end
end
