# app/boot.rb
require 'bundler/setup'
Bundler.require(:default)

require 'sinatra'
require 'erb'
require 'sqlite3'
require 'socket'
require 'uri'
require 'dotenv'
require 'open3'
require 'cgi'

# Requiere primero todos los archivos en la carpeta 'app/lib'
Dir[File.join(__dir__, 'lib', '**', '*.rb')].each { |file| require file }

# Luego requiere todos los archivos en la carpeta 'app' y subcarpetas, excluyendo 'lib'
Dir[File.join(__dir__, '**', '*.rb')].each do |file|
  next if file.include?('/lib/')

  require file
end

env_file = './config/.env'
Dotenv.load(*env_file)
