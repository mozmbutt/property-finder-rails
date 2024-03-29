class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]
  before_action :authenticate_account!, only: %i[new create edit update destroy]
  before_action :set_sidebar, except: [:show]

  # GET /properties or /properties.json
  def index
    @title = 'All Properties'
    @properties = Property.paginate(page: params[:page], per_page: 10)
  end

  # GET /properties/1 or /properties/1.json
  def show
    @agent = @property.account
    @title = @property.name
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit; end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)
    @property.account_id = current_account.id
    save_and_show_property
  end

  def save_and_show_property
    respond_to do |format|
      if @property.save
        PropertyJob.set(wait: 15.seconds).perform_later(@property, current_account)
        format.html { redirect_to properties_path, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @id = @property.id
    @property.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def property_params
    params.require(:property).permit(:name, :address, :price, :rooms, :bathrooms, :photo)
  end

  def set_sidebar
    @show_sidebar = true
  end
end
