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

  def create
    # Parameters: {"query_image" =>"a", "query_caption"=>"b", "query_owner_id"=>"c"}

  input_username = params.fetch("query_username")

  a_new_user = User.new

  a_new_user.username = input_username

  a_new_user.save
  
  next_url = "/users/" + a_new_user.username.to_s
  redirect_to(next_url)
  end

  def update
    # Parameters: {"query_image" =>"a", "query_caption"=>"b", "query_owner_id"=>"c"}

  the_id = params.fetch("modify_id")

  matching_users = User.where({ :id => the_id })
  the_user = matching_users.at(0)

  input_username = params.fetch("query_username")

  the_user.username = input_username

  the_user.save
  
  next_url = "/users/" + the_user.username.to_s
  redirect_to(next_url)
  end

end
