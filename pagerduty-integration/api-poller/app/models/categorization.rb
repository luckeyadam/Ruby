class Categorization < ApplicationRecord
    belongs_to :alert
    belongs_to :endpoint
end
