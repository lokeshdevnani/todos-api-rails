# app/lib/json_web_token.rb
class JsonWebToken
  HMAC_SECRET = Rails.application.secrets.secret_key_base

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    decoded_jwt = JWT.decode(token, HMAC_SECRET)
    # get payload: first index in decoded array
    body = decoded_jwt[0]
    HashWithIndifferentAccess.new body
    # rescue from expiry exception
  rescue JWT::ExpiredSignature, JWT::VerficationError => e
    raise ExceptionHandler::ExpiredSignature, e.message
  end
end
