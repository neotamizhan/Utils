require 'sinatra'
require 'haml'


post '/uni2hex' do
  val = params[:phrase]  
  val.unpack("U"*val.size).collect{|x| x.to_s(16).rjust(4,'0')}.join.upcase  
end

post '/hex2uni' do 
  val = params[:phrase]
  val.scan(/\w{4}/).map{|x| [x.to_i(16)].pack('U')}.join
end

get '/' do
  haml ''
end
