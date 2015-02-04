class KittensController < ApplicationController

	def index
		@kittens = Kitten.all
	end

	def new 
		@kitten = Kitten.new
	end

  def create
  	@kitten = Kitten.new(kitten_params)
  	if @kitten.save
  		flash[:success]   = "You have created a kitten."
  		redirect_to @kitten
  	else
  		flash.now[:error] = "Creation failure. Check parameters."
  		render 'new'
  		
  	end
	end

	def edit
		@kitten = Kitten.find(params[:id])
	end

	def update
		@kitten = Kitten.find(params[:id])
		if @kitten.update_attributes(kitten_params)
			flash[:success]   = "You have edited a kitten."
			redirect_to @kitten
			
		else
			flash.now[:error] = "Edit failure. Check parameters."
			render 'edit'
			
		end
	end

	def show
		@kitten = Kitten.find(params[:id])
	end

	def destroy
		flash[:success] = "You have destroyed a kitten."
		@kitten = Kitten.find(params[:id]).destroy
		redirect_to root_path

	end

  private

  def kitten_params
		params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
