Soopli::Engine.routes.draw do
  resources :suppliers do
    collection { get :versions }
    resources :rag_statuses
  end
  get 'suppliers/:id/version' => 'suppliers#version', as: :version_suppliers
  
  resources :teams do
    collection { get :versions }
  end
  get 'teams/:id/version' => 'teams#version', as: :version_teams
  
  resources :event_types do
    collection { get :versions }
  end
  get 'event_types/:id/version' => 'event_types#version', as: :version_event_types
  
  resources :supplier_types do
    collection { get :versions }
  end
  get 'supplier_types/:id/version' => 'supplier_types#version', as: :version_supplier_types
  
  resources :contract_types do
    collection { get :versions }
  end
  get 'contract_types/:id/version' => 'contract_types#version', as: :version_contract_types
  
  root :to => "entities#index"

  
  resources :entities do
    collection { get :versions }
  end
  get 'entities/:id/version' => 'entities#version', as: :version_entities
  
  resources :categories do
    collection { get :versions }
  end
  get 'categories/:id/version' => 'categories#version', as: :version_categories

  resources :positions do
    collection { get :versions }
  end
  get 'positions/:id/version' => 'positions#version', as: :version_positions
  
  #resources :rag_statuses
  resources :customers  
  resources :people
end
