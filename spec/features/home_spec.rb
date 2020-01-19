require 'rails_helper'

describe 'navegacao' do 
	describe 'HomePage' do
		it 'acessou com sucesso' do
			visit root_path
			expect(page.status_code).to eq(200)
		end

		it 'pode acessar tela de login ' do
			visit root_path
			click_on "Login"
			expect(page.status_code).to eq(200)
			expect(page).to have_content(/Login/)
		end

		it 'pode acessar meus videos apos login' do
			user = User.create(nome: "Fulano", email: "fulano@test.com", password: "abcdef", password_confirmation: "abcdef")			
			login_as(user, :scope => :user)
			visit root_path
			click_on "Meus Vídeos"
			expect(page.status_code).to eq(200)
			expect(page).to have_content(/Meus videos/)
		end

		it 'pode acessar novo video apos login' do
			user = User.create(nome: "Fulano", email: "fulano@test.com", password: "abcdef", password_confirmation: "abcdef")			
			login_as(user, :scope => :user)
			visit root_path
			click_link("new_video")
			expect(page.status_code).to eq(200)
			expect(page).to have_content("Novo vídeo")
		end

	end	
end