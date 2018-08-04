class VariantsController < ApplicationController
  def index
    variants = find_bicycle.variants
    render json: VariantSerializer.new(variants).serialized_json, status: :ok
  end

  def show
    variant = find_variant
    render json: VariantSerializer.new(variant).serialized_json, status: :ok
  end

  def update
    find_variant.update!(variant_params)
    head(:ok)
  end

  def destroy
    find_variant.destroy!
    head(:no_content)
  end

  private

  def find_bicycle
    Bicycle.find_by!(id: params[:bicycle_id])
  end

  def find_variant
    find_bicycle.variants.find_by!(id: params[:id])
  end

  def variant_params
    params.require(:variant).permit(:price_cents, :sku)
  end
end
