class TransactionsController < ApplicationController
  def index
  end
  
  def debt
    @users = Transaction.show_debtor(session[:user_id])
    @totalall = 0 // duy: @totalall, calcutate in view
    @users.each do |single|
      @totalall += single.total
    end
  end

  def debtlist
    @details = Transaction.details_debtor(session[:user_id],params[:id] )
  end

  def creditlist
    @details = Transaction.details_creditor(session[:user_id],params[:id] )

  end
  
  def history
    @history = Transaction.show_history(session[:user_id])
  end

  def new
    @listusers = User.where.not(id: session[:user_id])
    @transaction = Transaction.new 
  end

  def create
    @transaction = Transaction.create(transaction_params)
    @transaction.creditorid = session[:user_id]       
    @transaction.status = 2 // duy: magic number => use constant

    if @transaction.save   
      flash[:notice] = 'Product added!'   
      redirect_to debtlist_path(@transaction.debtorid)   
    else   
      flash[:error] = @transaction.errors[:note]
      redirect_back fallback_location: new_transaction_path
    end  
  end

  def credit
    @totalall = 0
    @users = Transaction.show_creditor(session[:user_id])

    @users.each do |single|
      @totalall += single.total
    end
  end
  
  def update
    @data = Transaction.find_by(id: params[:id])
    @data.status = params[:mode]
    if @data.save   
      flash[:notice] = 'Product saved!'   
      redirect_back fallback_location: debtlist_path
    else   
      flash[:error] = 'Failed to modifie product!'   
      render :new   
    end  
  end

  private
  def transaction_params
    params.require(:transaction).permit(:creditorid, :debtorid, :note, :amount, :datedebt, :status)
  end
  
end
