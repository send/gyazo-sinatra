# frozen_string_literal: true

require 'spec_helper'

describe 'Gyazo::Controller' do
  def app
    Gyazo::Controller
  end

  let(:image_path) { File.join(__dir__, '/fixtures/screenshot.png') }

  let(:image_data) { File.read(image_path) }

  let(:image_hash) { Digest::MD5.hexdigest(image_data).to_s }

  describe 'POST /' do
    it 'returns the picture url and saves the image to server' do
      post '/', imagedata: Rack::Test::UploadedFile.new(image_path)
      expect(last_response).to be_ok
      expect(last_response.body).to eq "https://gyazo.send.sh/images/#{image_hash}.png"
      expect(File.read(File.join(__dir__, "../public/images/#{image_hash}.png")))
        .to eq image_data
    end

  end
end
