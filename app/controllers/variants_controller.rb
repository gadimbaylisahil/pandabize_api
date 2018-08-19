class VariantsController < ApplicationController
  before_action :generate_options, only: %i[index show]
  def index
    variants = find_bicycle.variants.count == 1 ? find_bicycle.variants : find_bicycle.variants.where(is_initial: false)
    render json: VariantSerializer.new(variants, @options).serialized_json, status: :ok
  end

  def show
    variant = find_variant
    render json: VariantSerializer.new(variant, @options).serialized_json, status: :ok
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

  def generate_options
    @options = {}
    if params[:included].present?
      @options[:include] = params[:included].split(',').map do |included|
        included.to_sym
      end
    end
  end

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
