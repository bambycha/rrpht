class PagesController < ApplicationController

  def page

    render params[:page]

  rescue ActionView::MissingTemplate => e
    if e.message =~ /Missing template/
      raise ActionController::RoutingError.new('Page not found')
    else
      raise e
    end
  end

end