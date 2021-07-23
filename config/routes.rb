# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users
  root "home#index"

resources :builds do
  #resources :cpus
  # resources :mobos
  # resources :cpu_fans
  # resources :gpus
end

  get 'parts/cpu' => 'parts#cpu', as: 'cpu'
  get 'parts/mobo' => 'parts#mobo', as: 'mobo'
  get 'parts/case' => 'parts#case', as: 'case'
  get 'parts/gpu' => 'parts#gpu', as: 'gpu'
  get 'parts/hdd' => 'parts#hdd', as: 'hdd'
  get 'parts/psu' => 'parts#psu', as: 'psu'
  get 'parts/ram' => 'parts#ram', as: 'ram'
  get 'parts/ssd' => 'parts#ssd', as: 'ssd'
  get 'parts/case_fan' => 'parts#case_fan', as: 'case_fan'
  get 'parts/cpu_fan' => 'parts#cpu_fan', as: 'cpu_fan'
end
