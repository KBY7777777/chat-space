#応用No109の実装にて作成

json.array! @users do |user|  #カリからのコピペのままなので、実行すると齟齬が出る場合がある
  json.id user.id  #カリからのコピペのままなので、実行すると齟齬が出る場合がある
  json.name user.name  #カリからのコピペのままなので、実行すると齟齬が出る場合がある
end
