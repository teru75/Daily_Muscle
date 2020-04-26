// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require Chart.min
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require moment
//= require fullcalendar
//= require cocoon
//= require bootstrap-sprockets
//= require_tree .


// マイメニューを編集する記述
var display=function() {
  //マイサプリメントを編集する記述
  if(document.getElementById('my_supplement') != null) {
    var edit = document.getElementById('my_supplement_edit');
    var menu = document.getElementById('my_supplement');
    var title = document.getElementById('my_supplement-title');
    //取得した情報からスタイルについての状態のみをstateに代入
    state=edit.style.display;
    //デバッグ用にlogに出力
    console.log(state);
    //非表示中のときの処理
    if(state=="none"){
         //スタイルを表示(block)に切り替え
         edit.setAttribute("style","display:block");
         menu.setAttribute("style","display:none");
         title.textContent = 'マイサプリメント編集';
        //デバッグ用にinlineをlogに出力
        console.log("block");
    }else{
         //スタイルを非表示(none)に切り替え
        edit.setAttribute("style","display:none");
        menu.setAttribute("style","display:block");
        title.textContent = 'マイサプリメント詳細';
        //デバッグ用にnoneをlogに出力
        console.log("none");
    }
  }

  //イベントテンプレートを編集する記述
  if(document.getElementById('event_template') != null) {
    var edit = document.getElementById('event_template_edit');
    var menu = document.getElementById('event_template');
    var title = document.getElementById('event_template-title');
    var introduction = document.getElementById('event_template_introduction');
    //取得した情報からスタイルについての状態のみをstateに代入
    state=edit.style.display;
    //デバッグ用にlogに出力
    console.log(state);
    //非表示中のときの処理
    if(state=="none"){
         //スタイルを表示(block)に切り替え
         edit.setAttribute("style","display:block");
         introduction.setAttribute("style","display:block", "margin-top: 45px");
         menu.setAttribute("style","display:none");
         title.textContent = 'イベントテンプレート編集';
        //デバッグ用にinlineをlogに出力
        console.log("block");
    }else{
         //スタイルを非表示(none)に切り替え
        edit.setAttribute("style","display:none");
        introduction.setAttribute("style","display:none");
        menu.setAttribute("style","display:block");
        title.textContent = 'イベントテンプレート詳細';
        //デバッグ用にnoneをlogに出力
        console.log("none");
    }
  }

  //管理者が会員を編集する記述
  if(document.getElementById('admin-customer') != null) {
    var edit = document.getElementById('admin-customer-edit');
    var menu = document.getElementById('admin-customer');
    var title = document.getElementById('admin-customer-title');
    //取得した情報からスタイルについての状態のみをstateに代入
    state=edit.style.display;
    //デバッグ用にlogに出力
    console.log(state);
    //非表示中のときの処理
    if(state=="none"){
         //スタイルを表示(block)に切り替え
         edit.setAttribute("style","display:block");
         menu.setAttribute("style","display:none");
         title.textContent = '会員編集';
        //デバッグ用にinlineをlogに出力
        console.log("block");
    }else{
         //スタイルを非表示(none)に切り替え
        edit.setAttribute("style","display:none");
        menu.setAttribute("style","display:block");
        title.textContent = '会員詳細';
        //デバッグ用にnoneをlogに出力
        console.log("none");
    }
  }

  //トレーニング概要を編集する記述
  if(document.getElementById('customer-event') != null) {
    var edit = document.getElementById('customer-event-edit');
    var menu = document.getElementById('customer-event');
    var title = document.getElementById('event-title');
    //取得した情報からスタイルについての状態のみをstateに代入
    state=edit.style.display;
    //デバッグ用にlogに出力
    console.log(state);
    //非表示中のときの処理
    if(state=="none"){
         //スタイルを表示(block)に切り替え
         edit.setAttribute("style","display:block");
         menu.setAttribute("style","display:none");
         title.textContent = 'メニュー編集';
        //デバッグ用にinlineをlogに出力
        console.log("block");
    }else{
         //スタイルを非表示(none)に切り替え
        edit.setAttribute("style","display:none");
        menu.setAttribute("style","display:block");
        title.textContent = 'メニュー詳細';
        //デバッグ用にnoneをlogに出力
        console.log("none");
    }
  }
}


$(window).load(function() {
  $('.bg-slider').bgSwitcher({
    images: [ 'assets/dread.jpg', 'assets/santoukin.jpg', 'assets/sideraise.jpg',  'assets/buttleroap.jpg', 'assets/burbel.jpg'], // 切り替える背景画像を指定
    interval: 4000, // 背景画像を切り替える間隔を指定 3000=3秒
    loop: true, // 切り替えを繰り返すか指定 true=繰り返す　false=繰り返さない
    shuffle: false, // 背景画像の順番をシャッフルするか指定 true=する　false=しない
    effect: "fade", // エフェクトの種類をfade,blind,clip,slide,drop,hideから指定
    duration: 2000, // エフェクトの時間を指定します。
    easing: "swing" // エフェクトのイージングをlinear,swingから指定

  });

});