Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/orders", to: "orders#create"
    end
  end
end
