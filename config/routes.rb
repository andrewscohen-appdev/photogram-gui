Rails.application.routes.draw do

#########################
# User Routes
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_id", { :controller => "users", :action => "show" })

#########################
# Photo Routes
  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:path_id", { :controller => "photos", :action => "show" })

end
