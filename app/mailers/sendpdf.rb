class Sendpdf < ActionMailer::Base
  default from: "from@example.com"

  def send_pdf(user, pdf)
  	  pdf = WickedPdf.new.pdf_from_string(pdf)
	  attachments['MyPDF.pdf'] = pdf
	  mail(:to => user.email, :subject => "awesome pdf, check it")
  end

end
