class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    # @cocktail.name = params[:cocktail][:name]
    # @cocktail.image_url = params[:cocktail]
    if @cocktail.save
      @dose = Dose.new(description: params[:cocktail][:doses][:description])
      @dose.cocktail = @cocktail
      @dose.ingredient = Ingredient.find(params[:cocktail][:ingredients])
      redirect_to cocktails_path if @dose.save
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :image_url, :photo, :instructions)
  end
end
