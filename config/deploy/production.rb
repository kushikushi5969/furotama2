server "18.178.169.126", user: "kussy", roles: %w{app db web}

set :ssh_options, {
  forward_agent: true,
  user: 'kussy',
  keys: ["#{ENV['KEY_FINGERPRINT']}"],
  auth_methods: %w(publickey),
}
