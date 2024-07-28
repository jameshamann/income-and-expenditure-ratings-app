class StatementsController < ApplicationController
  before_action :set_statement, only: %i[ show edit update destroy ]

  # GET /statements
  def index
    @statements = Statement.all
  end

  # GET /statements/1
  def show
  end

  # GET /statements/new
  def new
    @statement = Statement.new
  end

  # GET /statements/1/edit
  def edit
  end

  # POST /statements
  def create
    @statement = Statement.new(statement_params)

    if @statement.save
      redirect_to @statement, notice: "Statement was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /statements/1
  def update
    if @statement.update(statement_params)
      redirect_to @statement, notice: "Statement was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /statements/1
  def destroy
    @statement.destroy
    redirect_to statements_url, notice: "Statement was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statement
      @statement = Statement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def statement_params
      params.fetch(:statement).permit(:month, income: {}, expenditure: {})
    end
end
