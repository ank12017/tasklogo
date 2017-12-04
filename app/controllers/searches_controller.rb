class SearchesController < ApplicationController
	before_action :set_search, only: [:show, :edit, :update, :destroy]
  	
  	def index
	  	@logos = Logo.all
	  	@logos = Logo.search(params[:name])
      @blogs= Blog.all
  	end
  	def new
	  @search = Search.new
	  3.times do
	    question = @search.questions.build
	    1.times { question.answers.build }
	  end
	end
	def show
  end
	def edit
  	end
  	def create
    	@search = Search.new(search_params)

	    respond_to do |format|
	      if @search.save
	        format.html { redirect_to @search, notice: 'search was successfully created.' }
	        format.json { render :show, status: :created, location: @search }
	      else
	        format.html { render :new }
	        format.json { render json: @search.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  def update
    respond_to do |format|
      if @search.update(logo_params)
        format.html { redirect_to @search, notice: 'search was successfully updated.' }
        format.json { render :show, status: :ok, location: @search }
      else
        format.html { render :edit }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @search.destroy
    respond_to do |format|
      format.html { redirect_to searches_url, notice: 'Logo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_search
      @search = Search.find(params[:id])
    end

    def search_params
      params.require(:search).permit(:name, questions_attributes: [:id, :content, :_destroy, answers_attributes: [:id, :content, :_destroy]])
    end
end
