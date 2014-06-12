class FeeFactory < Struct.new(:params)
  def build
  	if params[:start_range].present? && params[:end_range].present?
      HearingFee.new params
    else
      NonMoneyClaimsFee.new params.except(:start_range, :end_range)
    end
  end
end