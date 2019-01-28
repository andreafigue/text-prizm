class AdminController < ApplicationController
	require 'csv'
	before_action :authorize_admin

  def upload

  	if request.post?
  		batch = Batch.new
  		batch.name = params[:batch_name]
  		batch.user = current_user
  		if batch.save
  			puts "Batch created" 
  		else
  			batch.errors.messages.each do |attr,msg|
		      puts(attr,msg)
		    end
  		end

  		csv_text = File.read(params[:file].path)
			csv = CSV.parse(csv_text, :headers => true)
			csv.each do |row|
			  text = Text.new
			  text.text_id = row['id']
			  text.text = row['full_text']
			  text.date = row['created_at']
			  text.username = row['user.screen_name']
			  text.batch_id = batch.id
			  if text.save
	  			puts "Text created" 
	  		else
	  			text.errors.messages.each do |attr,msg|
			      puts(attr,msg)
			    end
	  		end
			end

			flash[:success] = "Batch uploaded successfully!"
			redirect_to controller: "welcome", action: "index"
  	end
  end

  def list
  	@users = User.all
  end
end
