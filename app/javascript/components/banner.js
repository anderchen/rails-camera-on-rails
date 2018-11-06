import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["camera...", "lens...", "tripod...", "drone...", "SD Card..."],
    typeSpeed: 70,
    backSpeed: 40,
    shuffle: true,
    showCursor: true,
    loop: true
  });
}

export { loadDynamicBannerText };
