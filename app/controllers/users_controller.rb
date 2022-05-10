class UsersController < ApplicationController
  def index
    render({:template => "users_templates/index.html.erb"})
  end

  def show
    render({:template => "users_templates/show.html.erb"})
  end
end
