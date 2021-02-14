# frozen_string_literal: true

# The Router for HealthCheck routes
module PatientsRoutes
  def self.extended(router)
    router.instance_exec do
      resources :patients
    end
  end
end
