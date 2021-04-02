class HomeController < ApplicationController
  before_action :autenticate_user!
  def index
  end
end
