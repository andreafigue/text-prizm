class WelcomeController < ApplicationController
	before_action :authenticate_user!
  def index
  end

  def batches
  	@batches = Batch.all
  end
end
