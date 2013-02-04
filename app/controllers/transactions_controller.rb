class TransactionsController < ApplicationController
  before_filter :authenticate_user!
  def show
    @transactions= Transaction.all

  end
end
