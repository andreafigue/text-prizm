class CodingController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	@texts = Text.all
  	@codes = Code.all
  	@topics = Topic.all
  end

  def verify_is_user
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path)) unless current_user
  end
end
