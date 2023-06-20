class MembershipsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessablez_entity_message


def create
    membership = Membership.create!(membership_params)
    render json: membership, status: :created
end

private

def membership_params
    params.permit(:charge, :client_id, :gym_id)
end

def render_unprocessablez_entity_message(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
end
end 
