//応用No109、インクリメンタルサーチ機能実装のためファイル作成

$(function() {

  //さらに6）「問題4」にて、下記「addUser」関数の定義を追記
  function addUser(user) {
    let html = `
                <div class="Chat-Group-Member clearfix">
                  <p class="Chat-Group-Member__name">${user.name}</p>
                  <div class="Chat-Group-Member__add Chat-Group-Member__button" data-user-id="${user.id}" data-user-name="${user.name}">追加</div>
                </div>
                `;
                // console.log(html);    //動作確認用console
    $("#UserSearchResult").append(html);
  }

  //さらに下記「addNoUser」関数の定義を追記
  function addNoUser() {
    let html = `
                <div class="Chat-Group-Member clearfix">
                  <p class="Chat-Group-Member__name">ユーザーが見つかりません</p>
                </div>
                `;
                // console.log(html);    //動作確認用console
    $("#UserSearchResult").append(html);
  }

  //さらに「問題5」にて、下記「addMember」関数の定義を追記
  function addMember(name, id) {
    let html = `
                <div class="Chat-Group-Member">
                  <p class="Chat-Group-Member__name">${name}</p>
                  <input name="group[user_ids][]" type="hidden" value="${id}" />
                  <div class="Chat-Group-Member__remove Chat-Group-Member__button">削除</div>
                </div>
                `;
    $(".ChatMembers").append(html);
  }

  $("#UserSearch__field").on("keyup", function() {  //「keyup」イベントとは、キーボードのキーを離したときに発動させるもの
    let input = $("#UserSearch__field").val();
    // console.log(input);    //動作確認用console
    $.ajax({
      type: "GET",  //HTTPメソッド
      url: "/users",  //users_controllerの、indexアクションにリクエストの送信先を設定する
      dataType: 'json',
      data: { keyword: input }  //テキストフィールドに入力された文字を設定する
    })

    //さらに6）「問題4」にて、doneメソッドの内容を下記コードのとおり追記
    .done(function(users) {
      // console.log("success");    //動作確認用console
      // console.log(users);    //動作確認用console
      $("#UserSearchResult").empty();
      if (users.length !== 0) {
        users.forEach(function(user) {
          addUser(user);
        });
      }
      else if (input.length == 0) {
        // console.log(input);    //動作確認用console
        return false;
      }
      else {
        addNoUser();
      }
    })

    //さらに「問題4」にて、failメソッドの内容を下記コードのとおり追記
    .fail(function() {
      // console.log("failed");    //動作確認用console
      alert("通信エラーです。ユーザーが表示できません。");
    });
  });


  //さらに「問題5」にて、グループへのメンバー追加と削除の処理内容を下記コードのとおり追記
  //メンバー追加の処理内容を記述
  // $("#UserSearchResult").on("click", ".ChatMember__add", function() {
  $("#UserSearchResult").on("click", ".Chat-Group-Member__add", function() {
    // console.log("追加イベント発動");    //動作確認用console
    const userName = $(this).attr("data-user-name");
    const userId = $(this).attr("data-user-id");
    $(this).parent().remove();
    addMember(userName, userId);
  });

  //メンバー削除の処理内容を記述
  // $(".ChatMembers").on("click", ".ChatMember__remove", function() {
  $(".ChatMembers").on("click", ".Chat-Group-Member__remove", function() {
    // console.log("削除イベント発動");    //動作確認用console
    $(this).parent().remove();
  });

});
