const actionButton = document.querySelector('#action');
actionButton.addEventListener('click', () => {
  if (window.APP_CONFIG && window.APP_CONFIG.PAYSTACK_PUBLIC_KEY) {
    console.log('Paystack public key loaded.');
  }
  window.open('https://appstoreconnect.apple.com', '_blank');
});

console.log('App config loaded:', window.APP_CONFIG);
