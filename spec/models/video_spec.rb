require 'rails_helper'

RSpec.describe Video, type: :model do
	describe "Criacao do objeto" do
		before do
			@user = User.create(nome: "Fulano", email: "fulano@test.com", password: "abcdef", password_confirmation: "abcdef")
			@video = Video.create(nome: "Video #1", url: "https://content.jwplatform.com/manifests/yp34SRmf.m3u8", user: @user)				
		end

		it "Objeto valido" do
			expect(@video).to be_valid
		end

		it "Objeto invalido (vazio)" do
			@video.nome = nil
			@video.url = nil
			@video.user = nil
			expect(@video).to_not be_valid
		end

		it "Objeto com url invalida" do
			@video.url = "www.google.com"
			expect(@video).to_not be_valid
		end
	end
end
