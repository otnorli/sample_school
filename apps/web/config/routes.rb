# Department
get '/department/:department_id', to: 'department#show'
post '/department', to: 'department#create'
put '/department/:department_id', to: 'department#update'
delete '/department/:department_id', to: 'department#delete'
get '/department/:department_id/users', to: 'department#users'

# Class
get '/group/:group_id', to: 'group#show'
post 'group', to: 'group#create'
put '/group/:group_id', to: 'group#update'
delete 'group/:group_id', to: 'group#delete'
get '/group/:group_id/users', to: 'group#users'

# User
get '/user/:user_id', to: 'user#show'
post '/user', to: 'user#create'
put '/user/:user_id', to: 'user#update'
delete '/user/:user_id', to: 'user#delete'

# Role
get '/role/:role_id', to: 'role#show'
post '/role', to: 'role#create'
put '/role/:role_id', to: 'role#update'
delete '/role/:role_id', to: 'role#delete'
get '/role/:role_id/users', to: 'role#users'

# Classs membership
get '/group-membership/:group_membership_id', to: 'group_membership#show'
post '/group-membership', to: 'group_membership#create'
put '/group-membership/:group_membership_id', to: 'group_membership#update'
delete '/group-membership/:group_membership_id', to: 'group_membership#delete'
