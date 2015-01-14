class TemplatesController < ApplicationController
  before_filter :authenticate_user!

  def index

  end

  def template
    render :template => 'templates/' + params[:path], :layout => nil
  end

  def generate_pdf
  	list = List.find(params[:list_id])
  	user = list.user
	  Sendpdf.send_pdf(user, params[:text]).deliver
    render text: 'success'
  end

end
