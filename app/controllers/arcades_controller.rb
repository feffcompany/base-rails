class ArcadesController < ApplicationController
  before_action :set_arcade, only: %i[ show edit update destroy ]

  before_action :ensure_current_user_is_owner, only: [:destroy, :update, :edit]

  # GET /arcades or /arcades.json
  def index
    @arcades = Arcade.all
  end

  # GET /arcades/1 or /arcades/1.json
  def show
  end

  # GET /arcades/new
  def new
    @arcade = Arcade.new
  end

  # GET /arcades/1/edit
  def edit
  end

  # POST /arcades or /arcades.json
  def create
    @arcade = Arcade.new(arcade_params)
    @arcade.owner = current_user

    respond_to do |format|
      if @arcade.save
        format.html { redirect_to @arcade, notice: "Arcade was successfully created." }
        format.json { render :show, status: :created, location: @arcade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @arcade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arcades/1 or /arcades/1.json
  def update
    respond_to do |format|
      if @arcade.update(arcade_params)
        format.html { redirect_to @arcade, notice: "Arcade was successfully updated." }
        format.json { render :show, status: :ok, location: @arcade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @arcade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arcades/1 or /arcades/1.json
  def destroy
    @arcade.destroy
    respond_to do |format|
      format.html { redirect_to arcades_url, notice: "Arcade was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arcade
      @arcade = Arcade.find(params[:id])
    end

    def ensure_current_user_is_owner
      if current_user != @arcade.owner
        redirect_back fallback_location: root_url, alert: "You're not authorized for that."
      end
    end

    # Only allow a list of trusted parameters through.
    def arcade_params
      params.require(:arcade).permit(:name, :address, :comments_count, :owner_id)
    end
end
