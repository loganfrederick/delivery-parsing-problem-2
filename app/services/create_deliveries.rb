require 'csv'

# NOTE: Common code with CreatePlacements, 
# could be abstracted to a CreateX base service object or pattern
class CreateDeliveries

  FILE = "#{Rails.root}/doc/deliveries.csv".freeze

  def call
    rows = CSV.table(File.expand_path(FILE), converters: nil)
    table = CSV::Table.new(rows)

    # TODO: Enforce ordering by sorting on id or dates
    # NOTE: Assuming pre-sorted CSV
    table.each do |row|
      # TODO: Check if row can be passed directly into Delivery.create
      delivery_hash = {
        placement_id: row[:placement_id],
        date: Date.strptime(row[:date], '%m/%d/%Y').strftime('%d/%m/%Y'),
        impressions: row[:impressions]
      }

      Delivery.create!(delivery_hash)
    end
  end
end
