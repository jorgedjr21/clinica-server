# frozen_string_literal: true

# The Router for HealthCheck routes
module HealthCheckRoutes
  def self.extended(router)
    router.instance_exec do
      namespace :health_check do
        get '/', action: :index
      end
    end
  end
end
