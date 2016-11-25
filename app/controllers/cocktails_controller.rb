class CocktailsController < ActionController::Base

 before_action :set_cocktail, only: :show

 # GET /restaurants
 # GET /restaurants.json
 def index
   @cocktails = Cocktail.all
 end

 # GET /restaurants/1
 # GET /restaurants/1.json
 def show
  @dose = Dose.new
 end

 # GET /restaurants/new
 def new
   @cocktail = Cocktail.new
 end

 # GET /restaurants/1/edit


 # POST /restaurants
 # POST /restaurants.json
 def create
   @cocktail = Cocktail.new(cocktail_params)

   if @cocktail.save
     redirect_to new_cocktail_dose_path(@cocktail)
   else
     render :new
   end
 end

 # PATCH/PUT /restaurants/1
 # PATCH/PUT /restaurants/1.json


 # DELETE /restaurants/1
 # DELETE /restaurants/1.json


 private
   # Use callbacks to share common setup or constraints between actions.
   def set_cocktail
     @cocktail = Cocktail.find(params[:id])
   end

   # Never trust parameters from the scary internet, only allow the white list through.
   def cocktail_params
     params.require(:cocktail).permit(:name)
   end


end
