module ClinicScoped
  extend ActiveSupport::Concern

  included do
    acts_as_tenant(:clinic, class_name: 'Clinic', inverse_of: table_name.to_sym)
    validates :clinic, presence: true
    delegate :subdomain, to: :clinic
  end
end
