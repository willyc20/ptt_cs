class DataController < ApplicationController

  def index
    params[:category] ||= 0
    params[:state] ||= 0
    @category = params[:category]
    @data = Datum.where(:category => params[:category], :state => params[:state]).paginate(:page => params[:page])
  end

  def change
    data = Datum.find(params[:id])
    params[:state] ||= 0
    data.update(:state => params[:state])
    redirect_to(:back)
  end

end
