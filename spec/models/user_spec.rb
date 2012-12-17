# encoding: utf-8
#!/bin/env ruby

require 'spec_helper'
require 'factory_girl_rails'

describe User do

	context "devrait avoir un attribut" do
		 it 'name' do
		 	should respond_to(:name)
		 end
		 it "email" do 
		 	should respond_to(:email)
		 end
		 it "password" do 
		 	should respond_to(:password)
		 end
		 it "password_confirmation" do 
		 	should respond_to(:password_confirmation)
		 end
		 it "remember_me" do 
		 	should respond_to(:remember_me)
		 end
	end 
  
  	before(:each) do
		@attr = { 
			:name => "Example User", 
			:email => "user@example.com",
			:password => "foobar",
			:password_confirmation => "foobar"
		}
	end

	it "devrait exiger un nom" do
  		bad_guy = User.new(@attr.merge(:name => ""))
	    bad_guy.should_not be_valid
	end

	it "exige une adresse email" do
	    no_email_user = User.new(@attr.merge(:email => ""))
	    no_email_user.should_not be_valid
	end

	it "devrait rejeter les noms trop longs" do
	    long_nom = "a" * 51
	    long_nom_user = User.new(@attr.merge(:name => long_nom))
	    long_nom_user.should_not be_valid
	end

	it "devrait rejeter un nom identique jusqu'à la casse" do
	    upcased_name = @attr[:name].upcase
	    User.create!(@attr.merge(:name => upcased_name))
	    user_with_duplicate_name = User.new(@attr)
	    user_with_duplicate_name.should_not be_valid
	end

	it "devrait accepter une adresse email valide" do
	    adresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
	    adresses.each do |address|
	      valid_email_user = User.new(@attr.merge(:email => address))
	      valid_email_user.should be_valid
	    end
	end

	it "devrait rejeter une adresse email invalide" do
		adresses = %w[user@foo,com user_at_foo.org example.user@foo.]
		adresses.each do |address|
	    	invalid_email_user = User.new(@attr.merge(:email => address))
	    	invalid_email_user.should_not be_valid
		end
	end
	  
	it "devrait rejeter une adresse email invalide jusqu'à la casse" do
	    upcased_email = @attr[:email].upcase
	    User.create!(@attr.merge(:email => upcased_email))
	    user_with_duplicate_email = User.new(@attr)
	    user_with_duplicate_email.should_not be_valid
	end

    context "les associations aux recette" do

	    before(:each) do
	      @user = User.create(@attr)
	      @recette1 = FactoryGirl.create(:recette, :user => @user, :created_at => 1.day.ago)
	      @recette2 = FactoryGirl.create(:recette, :user => @user, :created_at => 1.hour.ago)
	    end

	    it "devrait avoir un attribut 'recettes'" do
	      @user.should respond_to(:recettes)
	    end

	    it "devrait avoir les bonnes recettes dans le bon ordre" do
	      @user.recettes.should == [@recette2, @recette1]
	    end

	    it "devrait détruire les recettes associées" do
	      @user.destroy
	      [@recette1, @recette2].each do |recette|
	        Recette.find_by_id(recette.id).should be_nil
    		end
    	end
	end


end
