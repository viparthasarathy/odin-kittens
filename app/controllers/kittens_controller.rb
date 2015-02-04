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
  		redirect_to @kitten
  	else
  		render 'new'
  	end
	end

	def edit
		@kitten = Kitten.find(params[:id])
	end

	def update
		@kitten = Kitten.find(params[:id])
		if @kitten.update_attributes(kitten_params)
			redirect_to @kitten
		else
			render 'edit'
	end

	def show
		@kitten = Kitten.find(params[:id])
	end

	def destroy
		@kitten = Kitten.find(params[:id]).destroy
		redirect_to root_path
	end

  private

  def kitten_params
		params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
