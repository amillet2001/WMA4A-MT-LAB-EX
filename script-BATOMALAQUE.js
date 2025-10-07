(function attachGreeting() {
  function onReady(fn) {
    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', fn, { once: true });
    } else {
      fn();
    }
  }

  onReady(function () {
    var btn = document.getElementById('greet-btn');
    if (!btn) return;
    btn.addEventListener('click', function () {
      alert('Hello! Thanks for visiting my portfolio.');
    });
  });
})();
