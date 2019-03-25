$(function() {
$('.slider').slick();


$('.center').slick({
	  adaptiveHeight: false,
	    autoplay: true,
variableWidth: true,
autoplaySpeed: 0, //待ち時間を０に
  speed: 10000, // スピードをゆっくり
  swipe: false, // 操作による切り替えはさせない
  cssEase: 'linear', // 切り替えイージングを'linear'に
  // 以下、操作後に止まってしまう仕様の対策
  pauseOnFocus: false,
  pauseOnHover: false,
  pauseOnDotsHover: false,

arrows: false,








 
  responsive: [
    {
      breakpoint: 768,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '0px',
        slidesToShow: 3
      }
    },
    {
      breakpoint: 480,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '0px',
        slidesToShow: 1
      }
    }
  ]
});

$('.slick').slick({
   asNavFor:'.thumbnail',
   arrows: true,
   slidesToShow:1,
   prevArrow:'<div class="arrow prev">PREV</div>',
   nextArrow:'<div class="arrow next">NEXT</div>',
 });
 $('.thumbnail').slick({
   asNavFor:'.slick',
   focusOnSelect: true,
   arrows: false,
   slidesToShow:4,
 });





$('.responsive').slick({
  dots: true,
  infinite: true,
  speed: 300,
  slidesToShow: 4,
  slidesToScroll: 4,
  responsive: [
    {
      breakpoint: 1024,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 3,
        infinite: true,
        dots: true
      }
    },
    {
      breakpoint: 600,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 2
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    }
    // You can unslick at a given breakpoint now by adding:
    // settings: "unslick"
    // instead of a settings object
  ]
});

});






