class RowsController < ApplicationController
  before_filter :set_form
  
  def index
    klass = @form.klass
    @rows = klass.find(:all)
  end
  
  def create
    klass = @form.klass
    row = klass.new(params[:row])
    
    respond_to do |want|
      if row.save
        want.html {redirect_to thanks_path}
      else
        want.html {render '/form/show'}
      end
    end
  end
  
  private
  def set_form
    @form = Form.find(params[:form_id])
  end
end