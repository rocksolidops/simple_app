class PagesController < ApplicationController
  def wait
    sleep params[:time].to_f
    render text: 'ok'
  end
end
