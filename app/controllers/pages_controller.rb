class PagesController < ApplicationController
  def sleep
    Kernel.sleep params[:time].to_f
    render text: 'ok'
  end

  def status
    render text: "status #{params[:code]} ", status: params[:code]
  end

  def internals
  end

  def commands
    @commands = `bash -c "compgen -abck"`.split("\n")
  end

  def health_check
    checks = {
      rails:    true,
      database: false,
    }
    begin
      ActiveRecord::Base.connection.select "show tables"
      checks[:database] = true
    rescue
    end
    # 200 if all values are truthy
    status = checks.values.all? ? 200 : 500
    render  json: checks, status: status
  end
end
