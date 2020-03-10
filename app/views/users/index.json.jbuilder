
json.array! @users do |user|

  json.extract! user, :name, :username, :email
end


