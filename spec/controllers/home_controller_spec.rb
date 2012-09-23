#!/bin/ruby
# encoding: utf-8

require 'spec_helper'

describe HomeController do
	render_views

  describe "GET 'index'" do
    it "devrait réussir" do
      get 'index'
      response.should be_success
    end
  end

end
