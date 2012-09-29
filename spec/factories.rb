#!/bin/ruby
# encoding: utf-8

require 'factory_girl_rails'

FactoryGirl.define do

	sequence :email do |n|
		"person-#{n}@example.com"
	end

	factory :user do |user|
		user.name					"Aurélien Bonneau"
		user.email					FactoryGirl.generate :email
		user.password 				"foobar"
		user.password_confirmation	"foobar"
	end

	factory :recette do |recette|
		recette.titre "MyString"
    	recette.description "MyString"
    	recette.ingredients "MyString"
   		recette.preparation "MyString"
		recette.association :user
	end
	
end