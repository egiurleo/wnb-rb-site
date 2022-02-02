# frozen_string_literal: true

module Api
  class DonationsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    def create
      if stripe_secret_key.nil?
        render status: 500, json: { error: 'Stripe secret key not set' } and return
      end

      Stripe.api_key = stripe_secret_key

      # prices_response = Stripe::Price.list({ product: donation_product_id })
      # price = prices_response['data'].find { |p| p['unit_amount'].to_i == donation_amount * 100 }

      # if price.nil?
      # end

      session =
        Stripe::Checkout::Session.create(
          {
            mode: 'payment',
            line_items: [
              {
                price_data: {
                  currency: 'USD',
                  product: donation_product_id,
                  unit_amount: donation_amount * 100,
                },
                quantity: 1,
              },
            ],
            success_url: 'https://wnb-rb.dev', # TODO: fix
            cancel_url: 'https://wnb-rb.dev', # TODO: fix
          },
        )

      redirect_to session.url, status: 303, allow_other_host: true
    end

    private

    def donation_amount
      params[:amount].to_i
    end

    def stripe_secret_key
      ENV['STRIPE_SECRET_KEY']
    end

    def donation_product_id
      ENV['DONATION_PRODUCT_ID']
    end
  end
end
