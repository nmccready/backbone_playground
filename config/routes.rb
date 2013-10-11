BackbonePlayground::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'welcome#index'
  get 'old_back/my_view' => 'old_back#my_view'
end
