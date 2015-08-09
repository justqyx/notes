document.addEventListener('DOMContentLoaded', function() {

  var message = document.getElementById('message');

  function renderHomePage() {
    message.innerHTML = 'Show Home Page';
  }

  function renderPostsPage() {
    message.innerHTML = 'Show Posts Page';
  }

  function renderCategoriesPage() {
    message.innerHTML = 'Show Categories Page';
  }

  function renderAboutPage() {
    message.innerHTML = 'Show About Page';
  }

  function renderErrorPage() {
    message.innerHTML = 'Sorry, the page is not exists.';
  }

  var maps = {
    '': renderHomePage,
    '#/': renderHomePage,
    '#/posts': renderPostsPage,
    '#/categories': renderCategoriesPage,
    '#/about': renderAboutPage
  };

  function render(url) {
    if (maps[url]) {
      maps[url]();
    } else {
      renderErrorPage();
    }
  }

  window.addEventListener('hashchange', function() {
    render(window.location.hash);
  });

  // Or we use the api: history.pushState and check every 50ms
  // setInterval(function() {
    // if current not equals window.location.pathname
    // then render(pathname)
    // and then history.pushState(null, null, '/products/5');
  // }, 50);

});
