class DecryptedsController < ApplicationController
  before_action :set_decrypted, only: [:show, :edit, :update, :destroy]

  # GET /decrypteds
  # GET /decrypteds.json
  def index
    @decrypteds = Decrypted.all
  end

  # GET /decrypteds/1
  # GET /decrypteds/1.json
  def show
  end

  # GET /decrypteds/new
  def new
    @decrypted = Decrypted.new
  end

  # GET /decrypteds/1/edit
  def edit
  end

  # POST /decrypteds
  # POST /decrypteds.json
  def create
    @decrypted = Decrypted.new(decrypted_params)

    respond_to do |format|
      if @decrypted.save
        format.html { redirect_to @decrypted, notice: 'Decrypted was successfully created.' }
        format.json { render :show, status: :created, location: @decrypted }
      else
        format.html { render :new }
        format.json { render json: @decrypted.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decrypteds/1
  # PATCH/PUT /decrypteds/1.json
  def update
    respond_to do |format|
      if @decrypted.update(decrypted_params)
        format.html { redirect_to @decrypted, notice: 'Decrypted was successfully updated.' }
        format.json { render :show, status: :ok, location: @decrypted }
      else
        format.html { render :edit }
        format.json { render json: @decrypted.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decrypteds/1
  # DELETE /decrypteds/1.json
  def destroy
    @decrypted.destroy
    respond_to do |format|
      format.html { redirect_to decrypteds_url, notice: 'Decrypted was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_decrypted
      @decrypted = Decrypted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def decrypted_params
      params.require(:decrypted).permit(:message)
    end
end
