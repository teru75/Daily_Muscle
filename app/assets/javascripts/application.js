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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require moment
//= require fullcalendar
//= require cocoon
//= require bootstrap-sprockets
//= require_tree .

// カレンダーを表示させる記述
$(function () {

          function eventCalendar() {
              return $('#calendar').fullCalendar({});
          };
          function clearCalendar() {
              $('#calendar').html('');
          };
          $(document).on('turbolinks:load', function () {
          eventCalendar();
          });
          $(document).on('turbolinks:before-cache', clearCalendar);

          $('#calendar').fullCalendar({
              events: '/events.json',
              //カレンダー上部を年月で表示させる
              titleFormat: 'YYYY年 M月',
              //曜日を日本語表示
              dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
              buttonText: {
                  prev: '前月',
                  next: '次月',
                  prevYear: '前年',
                  nextYear: '翌年',
                  today: '今日',
                  month: '月',
                  week: '週',
                  day: '日'
              },
              timeFormat: "HH:mm",
                //イベントの色を変える
              eventColor: '#63ceef',
              //イベントの文字色を変える
              eventTextColor: '#000000',
          });
});

// マイメニューを編集する記述
var display=function() {
    //切り替える対象の状態を取得
    var edit = document.getElementById('my_menu_edit');
    var menu = document.getElementById('my_menu');
    //取得した情報からスタイルについての状態のみをstateに代入
    state=edit.style.display;
    //デバッグ用にlogに出力
    console.log(state);
    //非表示中のときの処理
    if(state=="none"){
         //スタイルを表示(inline)に切り替え
         edit.setAttribute("style","display:block");
         menu.setAttribute("style","display:none");
        //デバッグ用にinlineをlogに出力
        console.log("inline");
    }else{
         //スタイルを非表示(none)に切り替え
        edit.setAttribute("style","display:none");
        menu.setAttribute("style","display:block");
        //デバッグ用にnoneをlogに出力
        console.log("none");
    }
}