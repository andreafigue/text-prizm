class CodingController < ApplicationController
  def index
  	@texts = Text.all
  	@codes = Code.all
  end
end
