class ContentsController < ApplicationController
    before_action :autenticate_user!
    before_action :set_content, only: [:show, :edit, :update, :destroy ]

    def index
        @contents = current_user.contents
    end
    	
    def new
        @content = Content.new
    end

    def create
        @content = current_user.contents.build(content_prams)

        if @content.save
            associate_tags!
            redirect-to contents_path, notice: 'criado com sucesso'
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @content.update(content_prams)
            associate_tags!
            redirect-to contents_path, notice: 'editado com sucesso'
        else
            render :edit
        end
    end

    def show; end

    def destroy
        @content.destroy
        redirect-to contents_path, notice: 'destruído com sucesso'
    end

    private
    def set_content
        @content = Content.find(params[:id])
    end
    def tags_params
        params.require(:content).permit(tags: [])[:tags].reject(&:blank?)
    end
    def content_prams
        params.require(:content).permit(:title, :description)
    end
    def associate_tags!
        tags = tags_params.map do |tag_name|
            current_user.tags.where(name: tag_name).first_or_initialize
        end
        @content.tags = tags
    end
  end
  