//応用No108、jQuery使用のためファイル作成

$(function(){

  // let last_message_id = $('.main-chat__content__message:last').data("message-id") || 0;    //メッセージ案件のclass名は「main-chat__content__message」なので変更
  // console.log(last_message_id)    //最新メッセージのid情報取得確認のconsole

  function buildHTML(message){
    if ( message.image ) {
      let html =
        // `<div class="main-chat__content__message">  //応用No110にて、カスタムデータ属性を埋め込む記述を追記
        `<div class="main-chat__content__message" data-message-id=${message.id}>
          <div class="main-chat__content__message__info">
            <div class="main-chat__content__message__info__name">
              ${message.user_name}
            </div>
            <div class="main-chat__content__message__info__date">
              ${message.created_at}
            </div>
          </div>
          <div class="main-chat__content__message__comment">
            <p class="main-chat__content__message__comment">
              ${message.content}
            </p>
            <img class="Message__image" src="${message.image}">
          </div>
        </div>`
      return html;
    }
    else {
      let html =
      // `<div class="main-chat__content__message">  //応用No110にて、カスタムデータ属性を埋め込む記述を追記
      `<div class="main-chat__content__message" data-message-id=${message.id}>
        <div class="main-chat__content__message__info">
          <div class="main-chat__content__message__info__name">
            ${message.user_name}
          </div>
          <div class="main-chat__content__message__info__date">
            ${message.created_at}
          </div>
        </div>
        <div class="main-chat__content__message__comment">
          <p class="main-chat__content__message__comment">
            ${message.content}
          </p>
        </div>
      </div>`
      return html;
    };
  }

  $('.form').on('submit', function(e){    //クラス名は「.form」
    e.preventDefault();    //インデントが1つ多かったため削除した
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(data){
      let html = buildHTML(data);
      $('.main-chat__content').append(html);
      $('form')[0].reset();
      //投稿と同時にスクロールを最下段まで移動させる処理
      $('.main-chat__content').animate({ scrollTop: $('.main-chat__content')[0].scrollHeight});
      //送信ボタンの連続押下を可能にするコード（Qiitaにて技法を調べた）
      $('.send-btn').prop('disabled', false);
    })
  
    //非同期に失敗した場合の処理を追記（alert表示のみ）
    .fail(function() {
      alert("メッセージ送信に失敗しました");
      $('.send-btn').prop('disabled', false);    //ここにも送信ボタン連続押下のコードを追記。alert表示後にreloadなしで投稿できる
    });

  });

  //応用No110にて、表示済みの最新メッセージのid情報を取得する仕組みとして、下記コードを追記。
  //（ただし、最終的にはautoReload.jsに転記して自動更新を適用させるので、全行を削除する）

  // let reloadMessages = function() {    //変数reloadMessages

  //   //カスタムデータ属性を利用し、ブラウザに表示されている最新メッセージのidを取得
  //   // let last_message_id = $('.MessageBox:last').data("message-id") || 0;    //カリどおりのコード。最新メッセージのidを変数last_message_idに代入
  //   let last_message_id = $('.main-chat__content__message:last').data("message-id") || 0;    //メッセージ案件のclass名は「main-chat__content__message」なので変更
  //   // console.log(last_message_id)    //最新メッセージのid情報取得確認のconsole
  //   $.ajax({
  //     url: "api/messages",    //ルーティングで設定した通り/groups/id番号/api/messagesとなるよう文字列を書く
  //     type: 'get',    //ルーティングで設定した通りhttpメソッドをgetに指定
  //     dataType: 'json',
  //     data: {id: last_message_id}    //dataオプションでリクエストに値を含める
  //   })

  //   .done(function(messages) {
  //     // console.log('success');  //動作確認のconsole

  //     if (messages.length !== 0) {  //更新するメッセージがない場合、doneのあとの処理が動かないようにする
  //       let insertHTML = '';  //追加するHTMLの入れ物を作る
  //       $.each(messages, function(i, message) {  //配列messagesの中身一つ一つを取り出し、HTMLに変換したものを入れ物に足し合わせる
  //         insertHTML += buildHTML(message)
  //       });
  //       // $('.MessageField').append(insertHTML);  //メッセージが入ったHTMLに、入れ物ごと追加
  //       $('.main-chat__content').append(insertHTML);  //メッセージが入ったHTMLに、入れ物ごと追加
  //       // $('.MessageField').animate({ scrollTop: $('.MessageField')[0].scrollHeight});  //メッセージ追加と同時に、最新メッセージの表示箇所までスクロールを自動で移動
  //       $('.main-chat__content').animate({ scrollTop: $('.main-chat__content')[0].scrollHeight});  //メッセージ追加と同時に、最新メッセージの表示箇所までスクロールを自動で移動
  //     }
  //   })

  //   .fail(function() {
  //     alert('error');
  //   });
  // };

  // //応用No110にて、一定時間おきに自動で処理のRrequestをかける設定のコードを追記
  // setInterval(reloadMessages, 7000);  //7000ミリ秒＝7秒ごとにreloadMessages関数を発動させる設定

})
