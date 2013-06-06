class PagesController < ApplicationController
  def index
    sleep 3
    render text: 'ok'
  end
end
