require 'rails_helper'

describe 'Navegacao' do 
	describe 'Videos Index' do
		it 'deve chamar a tela de login para ter acesso' do
			visit videos_path
			expect(page).to have_content(/Login/)
		end

		it 'deve exibir os videos do usuario logado' do
			user = User.create(nome: "Fulano", email: "fulano@test.com", password: "abcdef", password_confirmation: "abcdef")			
			login_as(user, :scope => :user)
			visit videos_path
			expect(page).to have_content(/Meus videos/)
		end
	end

	describe 'Videos creation' do
		before do
			user = User.create(nome: "Fulano", email: "fulano@test.com", password: "abcdef", password_confirmation: "abcdef")
			login_as(user, :scope => :user)
			visit new_video_path
		end

		it 'visualizar o formulario de novo video' do
			expect(page.status_code).to eq(200)
		end

		it 'criar um novo video com o usuario atual associado' do
			fill_in 'video[nome]', with: "Video #1"
			fill_in 'video[url]', with: "https://content.jwplatform.com/manifests/yp34SRmf.m3u8"
			click_on "Salvar"

			expect(User.last.videos.last.nome).to eq("Video #1")
			expect(page).to have_content(/Meus videos/)
		end
	end

	describe 'Videos edit' do
		before do
			user = User.create(nome: "Fulano", email: "fulano@test.com", password: "abcdef", password_confirmation: "abcdef")
			@video = Video.create(nome: "Video #1", url: "https://content.jwplatform.com/manifests/yp34SRmf.m3u8", 
				view_counter: 0, user: user)
			login_as(user, :scope => :user)			
		end

		it 'edicao do video acionado pelo link da pagina index' do
			visit videos_path
			click_link("edit_#{@video.id}")
			expect(page.status_code).to eq(200)
		end

		it 'pode edicao do video' do
			visit edit_video_path(@video)
			fill_in 'video[nome]', with: "Edited video #1"
			fill_in 'video[url]', with: "https://content.jwplatform.com/manifests/jp34SRmf.m3u8"

			click_on "Salvar"
			expect(page).to have_content(/Meus videos/)

		end
	end

	describe 'Video show ' do
		before do
			user = User.create(nome: "Fulano", email: "fulano@test.com", password: "abcdef", password_confirmation: "abcdef")
			@video = Video.create(nome: "Video #1", url: "https://content.jwplatform.com/manifests/yp34SRmf.m3u8", 
				view_counter: 0, user: user)
			login_as(user, :scope => :user)
		end

		it 'pode acessar via pagina do index ' do
			visit videos_path
			click_link("show_#{@video.id}")
			expect(page.status_code).to eq(200)
		end

		it 'pode acessar o video ' do
			visit video_path(@video)
			expect(page).to have_content(@video.nome)
		end
	end


	describe 'Videos delete' do
		before do
			user = User.create(nome: "Fulano", email: "fulano@test.com", password: "abcdef", password_confirmation: "abcdef")
			@video = Video.create(nome: "Video #1", url: "https://content.jwplatform.com/manifests/yp34SRmf.m3u8", 
				view_counter: 0, user: user)
			login_as(user, :scope => :user)
		end

		it 'pode ser excluido ' do
			visit videos_path
			click_link("delete_#{@video.id}")
			expect(page.status_code).to eq(200)
		end
	end
end