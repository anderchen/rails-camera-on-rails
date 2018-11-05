import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["camera...", "lens...", "tripod...", "drone..."],
    typeSpeed: 40,
    loop: true
  });
}

export { loadDynamicBannerText };
