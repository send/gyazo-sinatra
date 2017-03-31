# frozen_string_literal: true

require 'digest/md5'
require 'sdbm'

module Gyazo
  class Controller < Sinatra::Base

    configure do
      set :dbm_path, 'db/id'
      set :image_dir, 'public/images'
      set :image_url, 'http://gyazo.send.sh/images'
      set :server, :puma
    end

    post '/' do
      id = request[:id]
      data = request[:imagedata][:tempfile].read
      hash = Digest::MD5.hexdigest(data).to_s
      dbm = SDBM.open(settings.dbm_path, 0644)
      dbm[hash] = id
      File.write(File.join(settings.image_dir, "#{hash}.png"), data)

      "#{settings.image_url}/#{hash}.png"
    end
  end
end
