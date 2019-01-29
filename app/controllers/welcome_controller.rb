class WelcomeController < ApplicationController
	before_action :authenticate_user!
	require "csv"

  def index
  end

  def batches
  	@batches = Batch.all
  end

  def to_csv
  	#@data = Coding.joins(:text).where(texts: {batch_id: params[:batch_id]}, user: current_user).order(:text_id)
  	@data = Text.where(batch_id: params[:batch_id]).order(:id)
  	@codings = current_user.codings
  	batch_name = Batch.find(params[:batch_id]).name

	  respond_to do |format|
	    format.html
	    format.csv do
	      headers['Content-Disposition'] = "attachment; filename=\""+batch_name.gsub(" ", "_").downcase+"_"+current_user.name.gsub(" ", "_").downcase+".csv"+"\""
	      headers['Content-Type'] ||= 'text/csv; charset=utf8'
	    end
	  end
  end
end
