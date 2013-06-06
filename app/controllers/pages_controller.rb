class PagesController < ApplicationController
  def wait
    sleep params[:time].to_f
    render text: 'ok'
  end

  def status
    render text: "status #{params[:code]} ", status: params[:code]
  end

  def internals
  end
end
