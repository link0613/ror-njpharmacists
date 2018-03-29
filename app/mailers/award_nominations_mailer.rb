class AwardNominationsMailer < ActionMailer::Base
  default from: "no-reply@njpharmacists.org"

  def award_nomination_confirmation(nomination_id)
  	@nomination = AwardNomination.find(nomination_id)
    mail :subject => "Thank you for submitting your award nomination",
         :to      => @nomination.nominator_email,
         :bcc 	  => 'njpha@njpharma.org',
         :from    => "no-reply@njpharmacists.org"
  end
end
