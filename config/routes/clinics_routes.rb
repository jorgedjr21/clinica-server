module ClinicsRoutes
  
  def self.extended(router)
    router.instance_exec do
      resources :clinics, defaults: { format: :json }
    end
  end

end
