class PhotosController < ApplicationController
  def index
  matching_photos = Photo.all

  @list_of_photos = matching_photos.order(:created_at => "desc")

    render({:template => "photos_templates/index.html.erb"})
  end

  def show
    url_photo = params.fetch("path_photo")

    matching_photos = Photo.where({ :id => url_photo})
  
    @the_photo = matching_photos.at(0)
  
    if @the_photo == nil
      redirect_to("/404")
    else
    render({:template => "photos_templates/show.html.erb"})
    end
  end

  def create
    # Parameters: {"query_image" =>"a", "query_caption"=>"b", "query_owner_id"=>"c"}

  input_image = params.fetch("query_image")
  input_caption = params.fetch("query_caption")
  input_owner_id = params.fetch("query_owner_id")

  a_new_photo = Photo.new

  a_new_photo.image = input_image
  a_new_photo.caption = input_caption
  a_new_photo.owner_id = input_owner_id

  a_new_photo.save
  
  next_url = "/photos/" + a_new_photo.id.to_s
  redirect_to(next_url)
  end

  def update
    # Parameters: {"query_image" =>"a", "query_caption"=>"b", "query_owner_id"=>"c"}

  the_id = params.fetch("modify_id")

  matching_photos = Photo.where({ :id => the_id })
  the_photo = matching_photos.at(0)

  input_image = params.fetch("query_image")
  input_caption = params.fetch("query_caption")

  the_photo.image = input_image
  the_photo.caption = input_caption

  the_photo.save
  
  next_url = "/photos/" + the_photo.id.to_s
  redirect_to(next_url)
  end

  def destroy

    the_id = params.fetch("toast_photo")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    the_photo.destroy

    redirect_to("/photos")
  end

end
