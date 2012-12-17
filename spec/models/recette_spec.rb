# encoding: utf-8
#!/bin/env ruby

require 'spec_helper'
require 'factory_girl_rails'


describe Recette do
  context "devrait avoir un attribut" do
		 it 'titre' do
		 	should respond_to(:titre)
		 end
		 it "description" do 
		 	should respond_to(:description)
		 end
		 it "ingredients" do 
		 	should respond_to(:ingredients)
		 end
		 it "preparation" do 
		 	should respond_to(:preparation)
		 end
	end 

	before(:each) do
		@user = FactoryGirl.create(:user)
		@attr = { 
			:titre => "MyString", 
			:description => "MyString",
			:ingredients => "MyString",
			:preparation => "MyString"
		}
	end

	it "devrait créer instance de recette avec les bons attributs" do
	    @user.recettes.create!(@attr)
	end

	context "validation" do

		it "devrait exiger un titre" do
			recette = Recette.new(@attr.merge(:titre => ""))
			recette.should_not be_valid
		end

		it "devrait exiger une description" do
			recette = Recette.new(@attr.merge(:description => ""))
			recette.should_not be_valid
		end

		it "devrait exiger des ingredients" do
			recette = Recette.new(@attr.merge(:ingredients => ""))
			recette.should_not be_valid
		end

		it "devrait exiger une preparation" do
			recette = Recette.new(@attr.merge(:preparation => ""))
			recette.should_not be_valid
		end
	end

	context "associations avec l'utilisateur" do

		before(:each) do
	      @recette = @user.recettes.create(@attr)
	    end

	    it "devrait avoir un attribut user" do
	      @recette.should respond_to(:user)
	    end

	    it "devrait avoir le bon utilisateur associé" do
	      @recette.user_id.should == @user.id
	      @recette.user.should == @user
	    end
	  end

end
