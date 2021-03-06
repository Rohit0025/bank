class LoansController < ApplicationController

  
  skip_before_action :verify_authenticity_token
    
  def new
    @loan = Loan.new
    render json: {loan: @loan}, status: :ok 
  end
    
  def show
    begin
      @loan = Loan.find(params[:id])
      render json: {loan:@loan}, status: :ok 
    rescue ActiveRecord::RecordNotFound => e
      render json: {error:e.message}, status: :not_found
    end
  end
    
  def create
    begin
      @loan = Loan.new(loan_params)
      if @loan.save
        render json: { loan: @loan}, status: :created 
      else
        render json: @loan.errors, status: :unprocessable_entity 
      end
    rescue ActiveRecord::InvalidForeignKey => e
      render json: {error:'Invalid Foreign Key'}, status: :unprocessable_entity 
    end
  end
    
  def destroy
    begin
      @loan = Loan.find(params[:id])
      @loan.destroy
      render json: {}, status: :ok 
    rescue ActiveRecord::RecordNotFound => e
      render json: {error:e.message}, status: :unprocessable_entity     
    end
  end
    
  def index
    @loans = Loan.all
    render json: {loans:@loans}, status: :ok 
  end
    
  def edit
    begin
      @loan = Loan.find(params[:id])
      render json: {loan:@loan}, status: :ok 
    rescue ActiveRecord::RecordNotFound => e
      render json: {error:e.message}, status: :not_found 
    end
  end
    
  def update
    begin
      @loan = Loan.find(params[:id])
      if @loan.update(loan_params)
        render json: {loan:@loan}, status: :ok 
      else
        render json: @loan.errors, status: :unprocessable_entity 
      end
    rescue => e
      render json: {error:e.message}, status: :unprocessable_entity 
    end
  end
  
  private
    def loan_params
      params.require(:loan).permit(:type, :amount, :rate, :time_limit)
    end
    
end