class EvqlidIteration < ApplicationRecord
  belongs_to :evqlid_result
  validates :iteration, uniqueness: { scope: :evqlid_result_id }
end
