class ContentsController < ApplicationController
    before_action :autenticate_user!

    def index
        @contents = current_user.contents
    end
    	
    def new
        @content = Content.new
    end

    def create
        @content = current_user.contents.build(content_prams)

        if @content.save
            redirect-to contents_path, notice: 'criado com sucesso'
        else
            render :new
        end
    end

    private
    def content_prams
        params.require(:content).permit(:title, :description)

  end
  