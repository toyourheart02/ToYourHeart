$(function() {
$('.slider').slick();


$('.center').slick({
	  adaptiveHeight: false,
	    autoplay: true,
	      prevArrow: '<a class="slick-prev" href="#">前へ</a>',



  centerMode: true,
  centerPadding: '0px',
  infinite: true,
  // speed: 300,
  slidesToShow: 3,
   // arrows: false,  // ←この階層

  autoplaySpeed: 0, //待ち時間を０に
  speed: 8000, // スピードをゆっくり
  swipe: false, // 操作による切り替えはさせない
  cssEase: 'linear', // 切り替えイージングを'linear'に
  // 以下、操作後に止まってしまう仕様の対策
  pauseOnFocus: false,
  // pauseOnHover: false,
  pauseOnDotsHover: false,
  // slidesToScroll: 5


 
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






