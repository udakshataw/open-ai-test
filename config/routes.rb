Rails.application.routes.draw do
  root "copilot#index"
  post '/copilot/ask', to: 'copilot#ask'
end