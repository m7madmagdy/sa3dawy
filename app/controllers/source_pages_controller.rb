class SourcePagesController < ApplicationController
  before_action :set_source, only: %i[index new create edit update destroy]
  before_action :set_source_page, only: %i[edit update destroy]

  # GET /source_pages or /source_pages.json
  def index
    @source_pages = @source.source_pages.all
  end

  # GET /source_pages/1 or /source_pages/1.json
  def show
  end

  # GET /source_pages/new
  def new
    @source_page = SourcePage.new
  end

  # GET /source_pages/1/edit
  def edit
  end

  # POST /source_pages or /source_pages.json
  def create
    @source_page = @source.source_pages.create(source_page_params)

    respond_to do |format|
      if @source_page.save
        format.html { redirect_to source_source_pages_path, notice: "Source page was successfully created." }
        format.json { render :show, status: :created, location: @source_page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @source_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /source_pages/1 or /source_pages/1.json
  def update
    respond_to do |format|
      if @source_page.update(source_page_params)
        format.html { redirect_to source_source_pages_path, notice: "Source page was successfully updated." }
        format.json { render :show, status: :ok, location: @source_page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @source_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_pages/1 or /source_pages/1.json
  def destroy
    @source_page.destroy

    respond_to do |format|
      format.html { redirect_to source_source_pages_path, notice: "Source page was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source
      @source = Source.find(params[:source_id])
    end
  
    def set_source_page
      @source_page = SourcePage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def source_page_params
      params.require(:source_page).permit(:name, :url, :source_id)
    end
end
