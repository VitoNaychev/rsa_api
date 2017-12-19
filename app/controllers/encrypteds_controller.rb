class EncryptedsController < ApplicationController
  before_action :set_encrypted, only: [:show, :edit, :update, :destroy]

  # GET /encrypteds
  # GET /encrypteds.json
  def index
    @encrypteds = Encrypted.all
  end

  # GET /encrypteds/1
  # GET /encrypteds/1.json
  def show
  end

  # GET /encrypteds/new
  def new
    @encrypted = Encrypted.new
  end

  # GET /encrypteds/1/edit
  def edit
  end

  # POST /encrypteds
  # POST /encrypteds.json
  def create
    @encrypted = Encrypted.new(encrypted_params)

    respond_to do |format|
      if @encrypted.save
        format.html { redirect_to @encrypted, notice: 'Encrypted was successfully created.' }
        format.json { render :show, status: :created, location: @encrypted }
      else
        format.html { render :new }
        format.json { render json: @encrypted.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /encrypteds/1
  # PATCH/PUT /encrypteds/1.json
  def update
    respond_to do |format|
      if @encrypted.update(encrypted_params)
        format.html { redirect_to @encrypted, notice: 'Encrypted was successfully updated.' }
        format.json { render :show, status: :ok, location: @encrypted }
      else
        format.html { render :edit }
        format.json { render json: @encrypted.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encrypteds/1
  # DELETE /encrypteds/1.json
  def destroy
    @encrypted.destroy
    respond_to do |format|
      format.html { redirect_to encrypteds_url, notice: 'Encrypted was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encrypted
      @encrypted = Encrypted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encrypted_params
      params.require(:encrypted).permit(:message)
    end
end
