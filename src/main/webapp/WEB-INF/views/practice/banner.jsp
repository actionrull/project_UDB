<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <title>Swiper demo</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
</head>
<body>
  <!-- Swiper -->
  <div class="swiper-container ">
    <div class="swiper-wrapper ">
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
      <div class="swiper-slide"><img src="./img/cash.png" alt="" /></div>
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination" ></div>
    <!-- Add Arrows -->
  </div>
  <!-- Swiper JS -->
  <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 8,
      spaceBetween: 30,
      slidesPerGroup: 8,
      loop: true,
      loopFillGroupWithBlank: true,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>
</body>
</html>