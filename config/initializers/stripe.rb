if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_AJuHvxhB7JbDLrFRnJsj7Tkv',
    secret_key: 'sk_test_FTGJmA5lMrq1Idnd0dEUNibU'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
