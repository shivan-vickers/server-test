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

    def open(query)
      shortcut = Shortcut.new(query)
      exe = File.basename shortcut.to_s
      dir = shortcut.to_s.sub(exe, '')
      cmd = "start \"\" /d \"#{dir}\" \"#{exe}\""
      puts cmd
      system cmd
    end
  end
end
