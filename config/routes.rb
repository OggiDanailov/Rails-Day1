Rails.application.routes.draw do
  
  get 'users/index'

  get 'users/new'

  get 'users/show'

root :to => "blogs#index"

get "/new" => "blogs#new"

post "/new" => "blogs#create"

get "/blogs/:id" => "blogs#show",  as: "blog"

get "/blogs/:id/edit" => "blogs#edit", as: "edit_blog"

# patch "/whatever" => "blogs#update"

patch "blogs/:id" => "blogs#update"

delete "blogs/:id" => "blogs#destroy"
  
end
