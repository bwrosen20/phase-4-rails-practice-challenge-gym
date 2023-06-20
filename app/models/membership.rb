class Membership < ApplicationRecord
    belongs_to :client
    belongs_to :gym

    validates :client_id, presence: true, uniqueness: {scope: :gym_id, message: "Client can only have 1 membership per gym"}
end
