class Current < ActiveSupport::CurrentAttributes
    # if not logged in, user is nil.
    attribute :user
end