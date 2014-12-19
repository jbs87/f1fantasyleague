class PagesController < ApplicationController
  skip_before_filter :require_login
  def rules
  end

  def about
  end
end
