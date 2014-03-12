BackbonePlayground::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'welcome#index'
  get 'to_do_mvc/my_views' => 'to_do_mvc#my_views'
  get 'to_do_mvc' => 'to_do_mvc#index'
  get 'old_back/my_views' => 'old_back#my_views'
  get 'new_back/my_views' => 'new_back#my_views'
end
