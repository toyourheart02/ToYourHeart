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

//= require jquery
//= require rails-ujs
//= require select2
//= require bootstrap-sprockets
//= require_tree .
//= require cocoon

window.onload = function(){
	$("body").on("click", ".favorite-icon", function(){
			swal('お気に入りに登録しました！');
			$(this).attr("class","glyphicon glyphicon-heart delete-icon");
			$(this).css("color", "red");
		});
		$("body").on("click", ".delete-icon", function(){
			swal('お気に入りから削除しました！');
			$(this).attr("class","glyphicon glyphicon-heart-empty favorite-icon");
			$(this).css("color", "gray");
		});
	$("body").on("click", ".cart-icon", function(){
		swal({
			title: "カートに追加しました！",
			icon: "success",
			button: "OK",
		});
	});
}