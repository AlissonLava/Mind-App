class ContentsController < ApplicationController
    before_action :autenticate_user!

    def index
        @contents = current_user.contents
    end
  end
  