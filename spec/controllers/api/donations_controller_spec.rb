# frozen_string_literal: true

require './spec/rails_helper'

RSpec.describe Api::DonationsController, type: :controller do
  before do
    ENV['STRIPE_SECRET_KEY'] =
      'sk_test_51JmdS1BHbLqUjvnWYB1gkYxQWrTy7VVXQLHJC136mgaDsvyKIt61UrPg1J4xGBTCNrdiP92IKGIksKwLCGqUg8WF00Oo9slOEp'
  end

  after { ENV['STRIPE_SECRET_KEY'] = nil }

  describe 'POST #create' do
  end
end
sk_test_51JmdS1BHbLqUjvnWYB1gkYxQWrTy7VVXQLHJC136mgaDsvyKIt61UrPg1J4xGBTCNrdiP92IKGIksKwLCGqUg8WF00Oo9slOEp
