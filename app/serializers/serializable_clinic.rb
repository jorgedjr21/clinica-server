class SerializableClinic < JSONAPI::Serializable::Resource
  type 'clinic'

  attributes :name, :subdomain, :contact_phone_1, :contact_phone_2, :created_at
end
