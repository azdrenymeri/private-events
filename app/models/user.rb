class User < ApplicationRecord
    has_many :events, foreign_key: "creator_id"
    has_many :attendances, foreign_key: "attendee_id"
    has_many :attended_events, through: :attendances, source: :attended_event


    scope :upcoming_events, ->(id) { Event.upcoming_events.where("creator_id = ? ", id)}
    scope :previous_events,->(id) {Event.previous_events.where("creator_id = ? ", id)}
end
