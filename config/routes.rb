Rails.application.routes.draw do

#########################
# User Routes
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })

#########################
# Photo Routes
  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:path_photo", { :controller => "photos", :action => "show" })
  get("/delete_photo/:toast_photo", { :controller => "photos", :action => "destroy" })

#########################
# Form Routes
get("/insert_photo", {:controller => "photos", :action => "create"})

end
