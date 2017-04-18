class ProductsFilterService
  def initialize(params)
    set_params(params)
  end

  def filter
    @scope = Product.all

    @scope = by_width  if @width_array
    @scope = by_price  if @price_array
    @scope = by_weight if @weight_array
    @scope = by_height if @height_array
    @scope = by_colors if @colors_array
    @scope = by_fragile  if @fragile
    @scope = by_discount if @discount_array
    @scope = by_material if @material_array
    @scope = by_fast_delivery if @fast_delivery

    @scope
  end

  private

  def by_width
    arr_width_range = arr_str_to_arr_range(@width_array)

    @scope.where(width: arr_width_range)
  end

  def by_price
    arr_price_range = arr_str_to_arr_range(@price_array)

    @scope.where(price: arr_price_range)
  end

  def by_weight
    arr_weight_range = arr_str_to_arr_range(@weight_array)

    @scope.where(weight: arr_weight_range)
  end

  def by_height
    arr_height_range = arr_str_to_arr_range(@height_array)

    @scope.where(height: arr_height_range)
  end

  def by_colors
    @scope.where(color: @colors_array)
  end

  def by_fragile
    @scope.where(fragile: true)
  end

  def by_material
    @scope.where(material: @material_array)
  end

  def by_fast_delivery
    @scope.where(fast_delivery: true)
  end

  def by_discount
    arr_discount_range = arr_str_to_arr_range(@discount_array)

    @scope.where(discount: arr_discount_range)
  end

  def set_params(params)
    @fragile       = params[:fragile]
    @fast_delivery = params[:fast_delivery]

    @width_array    = params[:width]
    @price_array    = params[:price]
    @weight_array   = params[:weight]
    @height_array   = params[:height]
    @colors_array   = params[:colors]
    @material_array = params[:material]
    @discount_array = params[:discount]
  end

  def arr_str_to_arr_range(array_params)
    array_params.map do |element|
      array_values = element.split('..').map(&:to_i)
      Range.new(array_values[0], array_values[1])
    end
  end
end
