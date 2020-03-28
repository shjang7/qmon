# frozen_string_literal: true

class Customers::ProfilesController < ApplicationController
  before_action :authenticate_customer!, only: :show
  before_action :find_customer, only: :show

  def show
    @purchases = current_customer.bought_items
  end

  private

  def find_customer
    @customer = current_customer
  end
end
