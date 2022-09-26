class InstallationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    installation = Installation.create(installation_attributes)

    if installation.persisted?
      head :ok
    else
      render json: { errors: installation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def installation_attributes
    attributes = installation_params
    attributes[:panel_type] = attributes.delete(:type)

    attributes[:panels_attributes] = attributes.delete(:panel_ids).map do |id|
      { code: id, panel_type: attributes[:panel_type] }
    end

    attributes[:company_attributes] = company_params
    attributes[:customer_attributes] = customer_params

    attributes
  end

  def installation_params
    params.require(:installation).permit(:address, :date, :type, panel_ids: [])
  end

  def company_params
    params.require(:company).permit(:name, :siren)
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :phone)
  end
end
