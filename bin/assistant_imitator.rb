require 'httparty'
require 'irb'

def open(request)
  HTTParty.post('http://localhost:8080', body: request.to_s)
end

IRB.start
