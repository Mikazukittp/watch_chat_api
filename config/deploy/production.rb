# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.
set :branch, 'master'

role :app, %w{mikazuki_ttp_gmail_com@104.155.212.191}
role :web, %w{mikazuki_ttp_gmail_com@104.155.212.191}
role :db,  %w{mikazuki_ttp_gmail_com@104.155.212.191}


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

set :stage, :production
set :rails_env, 'production'
server '104.155.212.191', user: 'mikazuki_ttp_gmail_com', roles: %w{web app}
set :ssh_options, {
  keys: [File.expand_path('~/.ssh/id_rsa')],
}

# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
