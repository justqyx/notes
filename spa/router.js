// http://krasimirtsonev.com/blog/article/A-modern-JavaScript-router-in-100-lines-history-api-pushState-hash-url
// A modern JavaScript router in 100 lines
// 
// [Requirements]
// * be less than 100 lines
// * supports hash type URLs like http://site.com#products/list
// * work with histroy API
// * provide easy-to-use API
// * not run automatically
// * listen for changes only if we want to

var Router = {
  routes: [],  // it keeps the current registered sites.
  mode: null,  // could be 'hash' or 'history' showing if we use the history API or not.
  root: '/',   // the root URL path of the application. It is needed only if we use pushState.
  
  // Then we need a method which will set up the router.  
  config: function(options) {
    this.mode = (
        options && options.mode &&
        options.mode === 'history' && !!(history.pushState)
      ) ? 'history' : 'hash';

    this.root = options && options.root ? '/' + this.clearSlashes(options.root) + '/' : '/';

    return this;
  },

  // Tell us where we are at the moment
  getFragment: function() {
    var fragment = '';
    if (this.mode === 'history') {
      fragment = this.clearSlashes(decodeURI(location.pathname + location.search));
      fragment = fragment.replace(/\?(.*)$/, '');
      fragment = this.root != '/' ? fragment.replace(this.root, '') : fragment;
    } else {
      var match = window.location.href.match(/#(.*)$/);
      fragment = match ? match[1] : '';
    }

    return this.clearSlashes(fragment);
  },

  clearSlashes: function(path) {
    return path.toString().replace(/\/$/, '').replace(/^\//, '');
  },

  add: function(re, handler) {
    if (typeof re === 'function') {
      handler = re;
      re = '';
    }
    this.routes.push({ re: re, handler: handler });
    return this;
  },

  remove: function(param) {
    for(var i=0; r; i<this.routes.length; r=this.routes[i]; i++) {
      if (r.handler === param || r.re.toString() === param.toString()) {
        this.routes.splice(i, 1);
        return this;
      }
    }
    return this;
  },

  flush: function() {
    this.routes = [];
    this.mode = null;
    this.root = '/';
    return this;
  },

  // compare the registered entries
  check: function(f) {
    var fragment = f || this.getFragment();
    for(var i=0; i<this.routes.length; i++) {
      var match = fragment.match(this.routes[i].re);
      if (match) {
        match.shift();
        this.routes[i].handler.apply({}, match);
        return this;
      }
    }
    return this;
  }
  
  // Monitoring for change
  // Why not 'hashchange' ?
  listen: function() {
    var self = this;
    var current = self.getFragment();
    var fn = function() {
      if (current !== self.getFragment()) {
        current = self.getFragment();
        self.check(current);
      }
    }
    clearInterval(this.interval);
    this.interval = setInterval(fn, 50);
    return this;
  },

  navigate: function(path) {
    path = path ? path : '';
    if (this.mode === 'history') {
      history.pushState(null, null, this.root + this.clearSlashes(path));
    } else {
      window.loaction.href.match(/#(.*)$/);
      window.location.href = window.location.href.replace(/#(.*)$/, '') + '#' + path;
    }
    return this;
  }
}

// Usage
//
// configuration
// Router.config({mode: 'history'});
//
// returning the user to the initial state
// Router.navigate();
//
// add routes
// Router.add(/about/, function() { console.log('about'); })
//       .add(/products\/(.*)\/edit\/(.*), function() { console.log('products', arguments); })
//       .add(function() { console.log('default'); })
//       .check('/products/12/edit/22').listen();
//
// forwarding
// Router.navigate('/about');
