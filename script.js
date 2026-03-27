/* =========================================
   NAVBAR SCROLL EFFECT
========================================= */
window.addEventListener('scroll', () => {
    const header = document.getElementById('navbar');
    if (window.scrollY > 50) {
        header.classList.add('scrolled');
    } else {
        header.classList.remove('scrolled');
    }
});

/* =========================================
   HERO SLIDER
========================================= */
document.addEventListener('DOMContentLoaded', () => {
    const slides = document.querySelectorAll('.slide');

    if (slides.length > 0) {
        let current = 0;

        setInterval(() => {
            slides[current].classList.remove('active');
            current = (current + 1) % slides.length;
            slides[current].classList.add('active');
        }, 8000);
    }
});

/* =========================================
   SCROLL REVEAL
========================================= */
const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = 1;
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, { threshold: 0.15 });

document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.reveal-on-scroll').forEach(el => {
        el.style.opacity = 0;
        el.style.transform = 'translateY(40px)';
        el.style.transition = 'all 0.8s ease';
        observer.observe(el);
    });
});
