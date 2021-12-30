# frozen_string_literal: true

class Temperature < ApplicationRecord
  scope :data_for_twenty_four, -> { where("stamp >= #{24.hour.ago.to_i}") }
  scope :by_time, lambda { |timestamp|
    data_for_twenty_four.order(Arel.sql("ABS(stamp - #{timestamp.to_i})")).first
  }

  def self.existed_timestamp?(stamp)
   [maximum(:stamp)..minimum(:stamp)].include?(stamp)
  end
end
