#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/karamalesa1980/lesson22\">Original</a> pattern has been modified for <a href=\"https://www.youtube.com/channel/UCiqUSuswB1_uU2BONwvCTYg?view_as=subscriber\">Karamalesa TV</a>"			
end

get '/contacts' do
	erb :contacts
end	

get '/about' do
	erb :about
end	

get '/something' do
	erb :something
end	

get '/visit' do
	erb :visit
end	

post '/visit' do
	@user_name   = params[:user_name]
	@user_phone  = params[:user_phone]
	@date_time   = params[:date_time]
	@professional = params[:professional]
	@color = params[:colorpicker]
	

	@title = 'Спасибо!'
	@message = "#{@user_name} мы будем вас ждать!  #{@date_time} "

	f = File.open './public/users.txt', 'a'
	f.write "User: #{@user_name}, Phone: #{@user_phone}, Date and time: #{@date_time}, Professional: #{@professional}, Color: #{@color}\n"
	f.close

	erb :visit

end

post '/contacts' do
	@user_email   = params[:user_email]
	@user_message  = params[:user_message]
	

	@title = 'Спасибо за ваше сообщение!'
	

	f = File.open './public/contacts.txt', 'a'
	f.write "User email: #{@user_email}, User message: #{@user_message}\n"
	f.close

	erb :contacts

end		
