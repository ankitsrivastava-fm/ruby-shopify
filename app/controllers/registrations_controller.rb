class RegistrationsController < Devise::RegistrationsController
  require 'secureRandom'
  def create
    super do |resource|
      tenant = Tenant.create(name: SecureRandom.uuid)
      resource.tenant = tenant
      resource.update(tenant_id: tenant.id)
    end
  end

  def after_sign_up_path_for(resource)
    welcome_index_path
  end

end
