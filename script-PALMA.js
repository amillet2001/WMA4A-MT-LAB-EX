window.addEventListener('scroll', () => {
  document.querySelectorAll('.info-card, .project-card').forEach(card => {
    const rect = card.getBoundingClientRect();
    if (rect.top < window.innerHeight - 100) {
      card.classList.add('visible');
    }
  });
});