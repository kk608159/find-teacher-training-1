class Provider < Base
  belongs_to :recruitment_cycle, param: :recruitment_cycle_year
  has_many :courses, param: :course_code

  def supporting_dfe_apply?
    opted_in_providers = %w[R55 1N1 S31 24L 1HQ L06 2LR 254 12K 1OT]
    opted_in_providers.include?(provider_code)
  end
end
