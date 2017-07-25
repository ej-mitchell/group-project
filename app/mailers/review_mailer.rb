class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    @email = review.book.user.email

    mail(
      to: @email,
      subject: "New Review for #{@review.book.title}"
    )
  end
end
