class Public::CustomersController < ApplicationController
  before_action :authenticate_Customer!
  def show
  end

  def edit
  end

  def unsubscribe
  end
end
