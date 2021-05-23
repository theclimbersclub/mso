# set to true for geocoding
# we recommend configuring local geocoding first
# see https://github.com/ankane/authtrail#geocoding
AuthTrail.geocode = true
AuthTrail.job_queue = :low_priority
# add or modify data
AuthTrail.transform_method = lambda do |data, request|
  data[:request_id] = request.request_id
end

# exclude certain attempts from tracking
AuthTrail.exclude_method = lambda do |data|
  # data[:identity] == "admin@example.com"
end

# AuthTrail.transform_method = lambda do |data, request|
#   data[:user] ||= User.find_by(email: data[:identity])
# end
