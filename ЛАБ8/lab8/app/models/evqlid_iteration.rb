class EvqlidIteration < ApplicationRecord
  belongs_to :evqlid_results
  validates :iteration, uniqueness: { scope: :evqlid_result_id }
end
