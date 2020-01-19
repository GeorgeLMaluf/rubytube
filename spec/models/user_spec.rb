require 'rails_helper'

RSpec.describe User, type: :model do 	
	describe "criacao" do
		before do
			@user = User.create(nome: "George L. Maluf", email: "georgelmaluf286@gmail.com", 
				password: "abcdef", password_confirmation: "abcdef")
		end


		it "pode ser criado " do
			expect(@user).to be_valid
		end

		it "não pode ser criado sem nome" do 
			@user.nome = nil
			expect(@user).to_not be_valid
		end
	end
end