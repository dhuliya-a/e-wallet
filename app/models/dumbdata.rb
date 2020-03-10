class Dumbdata < ApplicationRecord
    enum base_currency: CURRENCY
    enum target_currency: CURRENCY
end
