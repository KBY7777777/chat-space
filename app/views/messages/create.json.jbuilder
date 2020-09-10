#応用No108の実装にて作成

json.user_name @message.user.name
json.created_at @message.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.content @message.content
json.image @message.image_url
json.id @message.id    #応用No110にて、表示済みメッセージのid情報をJSON形式でやりとりするためのコードを追記
# json.id message.id    #APIとしたindexのjbuilderのコードから転記したため、誤って「@」が抜けている（メンターさんのご指摘で発覚）
