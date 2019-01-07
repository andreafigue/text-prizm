class CodingController < ApplicationController
  before_action :authenticate_user!

  def index
  	@texts = Text.all
  	@codes = Code.all
  	@topics = Topic.all
  	@codings = current_user.codings
  	@codings.cache_key
  end

  def add_topic

  	text_id = Integer(params[:text_id])
  	topic_id = Integer(params[:topic_id])

  	coding = Coding.find_by(user: current_user, text_id: text_id)

  	if coding.nil?
  		coding = Coding.new
  		coding.user = current_user
  		coding.text = Text.find(text_id)
  		coding.topic = Topic.find(topic_id)
  		
  		if coding.save
  			puts "Coding created"
  		else
  			coding.errors.messages.each do |attr,msg|
		        puts(attr,msg)
		    end
  		end
  	else
  		if coding.topic.nil?
  			coding.topic_id = topic_id
  		end

  		if coding.save
  			puts "Coding updated"
  		else
  			coding.errors.messages.each do |attr,msg|
		        puts(attr,msg)
		    end
		end
  	end

  end

  def add_code
  	
  	text_id = Integer(params[:text_id])
  	code_id = Integer(params[:code_id])

  	puts "Adding Code"

  	coding = Coding.find_by(user: current_user, text_id: text_id)

  	if coding.nil?
  		coding = Coding.new
  		coding.user = current_user
  		coding.code_1 = Code.find(code_id)
  		coding.text = Text.find(text_id)

  		if coding.save
  			puts "Coding created"
  		else
  			coding.errors.messages.each do |attr,msg|
		        puts(attr,msg)
		    end
  		end
  	else
  		if coding.code_1.nil?
  			coding.code_1_id = code_id
  		else
  			if coding.code_2.nil?
  				coding.code_2_id = code_id
  			end
  		end
  		if coding.save
  			puts "Coding updated"
  		end
  	end

  end

  def remove_topic

  	text_id = Integer(params[:text_id])
  	topic_id = Integer(params[:topic_id])

  	coding = Coding.find_by(user: current_user, text_id: text_id)

  	if coding.nil?
  		puts "Coding doesn't exists"
  	else
  		if coding.topic_id == topic_id
  			coding.topic = nil
  		end

  		if coding.save
  			puts "Coding Removed"
  		else
  			coding.errors.messages.each do |attr,msg|
		       puts(attr,msg)
		    end
  		end

  	end

  end

  def remove_code

  	text_id = Integer(params[:text_id])
  	code_id = Integer(params[:code_id])

  	puts "Removing Code"

  	coding = Coding.find_by(user: current_user, text_id: text_id)

  	if coding.nil?
  		puts "Coding doesn't exists"
  	else
  		if coding.code_1_id == code_id
  			coding.code_1 = nil
  		elsif coding.code_2_id == code_id
  			coding.code_2 = nil
  		end

  		if coding.save
  			puts "Coding Removed"
  		else
  			coding.errors.messages.each do |attr,msg|
		        puts(attr,msg)
		    end
  		end

  	end

  end

  def verify_is_user
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path)) unless current_user
  end
end
