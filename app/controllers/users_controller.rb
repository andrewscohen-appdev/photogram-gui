class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order(:username)

    render({:template => "users_templates/index.html.erb"})
  end

  def show
    # Parameters: {"path_username"}

    url_username = params.fetch("path_username")

    matching_users = User.where({ :username => url_username})

    @the_user = matching_users.at(0)

    if @the_user == nil
      redirect_to("/404")
    else
      render({:template => "users_templates/show.html.erb"})
    end
  end
end
