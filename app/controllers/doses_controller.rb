class DosesController < ActionController::Base
  before_action :set_dose, only: :destroy

def new
  @cocktail = Cocktail.find params[:cocktail_id]
  @dose = Dose.new
end

def create
  @cocktail = Cocktail.find params[:cocktail_id]
  @dose = Dose.new(dose_params)
  @dose.cocktail = @cocktail


  if @dose.save!
   redirect_to cocktail_path(@cocktail)
  else
    render :new
  end

end

def destroy
   @dose.destroy
   respond_to do |format|
     format.html { redirect_to doses_url, notice: 'Dose was successfully destroyed.' }
     format.json { head :no_content }
   end
 end

 private
   # Use callbacks to share common setup or constraints between actions.
   def set_dose
     @dose = Dose.find(params[:id])
   end

   # Never trust parameters from the scary internet, only allow the white list through.
   def dose_params
     params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
   end

end
