# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users
  root "home#index"

resources :builds do
  resources :cpus
  resources :mobos
  resources :cpu_fans
  resources :gpus
end

  get 'builds/cpu' => 'builds#cpu', as: 'cpu'
  get 'builds/mobo' => 'builds#mobo', as: 'mobo'
  get 'builds/case' => 'builds#case', as: 'case'
  get 'builds/gpu' => 'builds#gpu', as: 'gpu'
  get 'builds/hdd' => 'builds#hdd', as: 'hdd'
  get 'builds/psu' => 'builds#psu', as: 'psu'
  get 'builds/ram' => 'builds#ram', as: 'ram'
  get 'builds/ssd' => 'builds#ssd', as: 'ssd'
  get 'builds/case_fan' => 'builds#case_fan', as: 'case_fan'
  get 'builds/cpu_fan' => 'builds#cpu_fan', as: 'cpu_fan'
end
