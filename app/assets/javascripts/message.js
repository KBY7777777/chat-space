//応用No108、jQuery使用のためファイル作成

$(function(){
  function buildHTML(message){
    if ( message.image ) {
      let html =
        `<div class="main-chat__content__message">
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
      `<div class="main-chat__content__message">
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

  $('.form').on('submit', function(e){  //クラス名は「.form」
    e.preventDefault();  //インデントが1つ多かったため削除した
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
      $('.send-btn').prop('disabled', false);  //ここにも送信ボタン連続押下のコードを追記。alert表示後にreloadなしで投稿できる
    });

  });
})
