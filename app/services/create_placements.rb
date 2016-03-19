require 'csv'

class CreatePlacements

  FILE = "#{Rails.root}/doc/placements.csv".freeze

  def call
    rows = CSV.table(File.expand_path(FILE), converters: nil)
    table = CSV::Table.new(rows)

    # TODO: Enforce ordering by sorting on id or dates
    # NOTE: Assuming pre-sorted CSV
    table.each do |row|
      # TODO: Check if row can be passed directly into Placement.create
      placement_hash = {
        placement_id: row[:placement_id],
        name: row[:name],
        start: row[:start],
        end_date: row[:end_date],
        cpm: row[:cpm],
        budget: row[:budget]
      }

      Placement.create!(placement_hash)
    end
  end
end
