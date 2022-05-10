class CommentsController < ApplicationController

  def create
    # Parameters: {"query_image" =>"a", "query_caption"=>"b", "query_owner_id"=>"c"}

  input_body = params.fetch("query_body")
  input_photo_id = params.fetch("query_photo_id")
  input_author_id = params.fetch("query_author_id")

  a_new_comment = Comment.new

  a_new_comment.body = input_body
  a_new_comment.photo_id = input_photo_id
  a_new_comment.author_id = input_author_id

  a_new_comment.save
  
  next_url = "/photos/" + input_photo_id.to_s
  redirect_to(next_url)
  end

  # def update
  #   # Parameters: {"query_image" =>"a", "query_caption"=>"b", "query_owner_id"=>"c"}

  # the_id = params.fetch("modify_id")

  # matching_photos = Photo.where({ :id => the_id })
  # the_photo = matching_photos.at(0)

  # input_image = params.fetch("query_image")
  # input_caption = params.fetch("query_caption")

  # the_photo.image = input_image
  # the_photo.caption = input_caption

  # the_photo.save
  
  # next_url = "/photos/" + the_photo.id.to_s
  # redirect_to(next_url)
  # end

  # def destroy

  #   the_id = params.fetch("toast_photo")

  #   matching_photos = Photo.where({ :id => the_id })

  #   the_photo = matching_photos.at(0)

  #   the_photo.destroy

  #   redirect_to("/photos")
  # end

end
