class DeliveryCalculator
  attr_accessor :placement_id, :placement

  def initialize(placement_id)
    @placement_id = placement_id
  end

  def cost_of_deliveries_within_date_range(start_date, end_date)
    placement = Placement.where(placement_id: placement_id).where()
    impressions = Delivery.where(placement_id: placement_id).where("date >= '#{start_date}' AND date <= '#{end_date}'").pluck(:impressions)
    placement_cost = (total_impressions(impressions) / 1000) * placement.cpm
  end

  private def total_impressions(impressions_list)
    impressions_list.reduce(0, :+)
  end
end
