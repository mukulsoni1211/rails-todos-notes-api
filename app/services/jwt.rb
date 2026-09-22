class Jwt

  def self.encode(payload)
    JWT.encode(payload, nil, 'none')
  end

  def self.decode(token)
    JWT.decode(token, nil, true, { algorithm: 'none' })
  end
end
