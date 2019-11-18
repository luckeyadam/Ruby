class Alert < ApplicationRecord
    has_many :categorizations
    has_many :endpoints, through: :categorizations
end
