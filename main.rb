require 'openssl'
require 'httparty'

class Foo
  include HTTParty

  #########################################################
  # Configuration
  # See http://www.rubydoc.info/github/jnunemaker/httparty/HTTParty/ConnectionAdapter#content

  # Verify the server’s certificate against the ca certificate
  default_options[:verify] = true

  # Specify output of httparty debugger
  debug_output $stdout
  # debug_output $stderr

  # See http://www.rubydoc.info/github/jnunemaker/httparty/HTTParty/ClassMethods#default_timeout-instance_method
  default_timeout 30

  # Set headers for each request
  # http://www.rubydoc.info/github/jnunemaker/httparty/HTTParty/ClassMethods#headers-instance_method
  headers 'Accept' => '*/*', 'User-Agent' => 'Ruby'

  def perform(url, options={})
    response = Foo.get(url, options)
    return response
  rescue => e
    puts "[ERROR] #{e.inspect}"
  end

end

proxy = Foo.new
response = proxy.perform('https://www.google.com/')
puts "------------"
puts "response code: #{response.code}\n"
# puts "response body: #{response.body[0..100]}\n"
puts "------------"
puts "\n"
