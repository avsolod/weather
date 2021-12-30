# frozen_string_literal: true

class Health < Grape::API
  STATUS = 'Ok'

  desc 'Return backend status'

  get :health do
    STATUS
  end
end
