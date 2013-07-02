MeetMeServer::Application.routes.draw do

  root :to => "pages#home"
  
  match "page/:action", controller: "pages", as: :page

  match "groups/:action(/:password)", controller: "groups", as: :groups

  # match ':controller(/:action(/:id))(.:format)'
end
