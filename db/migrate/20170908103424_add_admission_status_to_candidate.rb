class AddAdmissionStatusToCandidate < ActiveRecord::Migration[5.1]
  def change
    add_column :candidates, :admission_status, :string, default: "Under Process"
    add_column :candidates, :rejection_reason, :text
  end
end
