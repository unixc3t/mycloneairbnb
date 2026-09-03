// import Swiper JS
import Swiper from 'swiper';
import { Navigation, Pagination } from 'swiper/modules';
// import Swiper styles
import 'swiper/css/navigation';
import 'swiper/css';

const swiper = new Swiper('.myswiper', {
  // Optional parameters
  loop: true,

 
 modules: [Navigation, Pagination], // Navigation arrows
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },

});

export {
  swiper
}