/* eslint no-unused-vars: "off"*/

var AABB, Action, AddShape, Behaviour, Body, Button, CanvasControl, Circle,
  Collision, CollisionControl, Demo, Drag, Engine, GJK, Gravity, Line, Mouse,
  PlayPause, Presets, Queue, Radio, RadioOption, Rectangle, Refresh, Rope,
  SATColl, Shape, Cord, Toggle, Vector, abs, atan, atan2, can,
  cancelAnimationFrame, ceil, cos, CanvasCenter, ctxx, customChangePrototype,
  demo, floor, generateRandomColor, getMax, getMin, getRandomInt,
  ImpulseResolution, info, info2, info3, info4, isEven, jcan, makeid, pi,
  plotItinerary, plotting, pow, requestAnimationFrame, round, shape1, shape2,
  shape3, sin, solveQuadratic, sqr, sqrt, tan, test1, test2, test3, test4, win;

var hasProp = {}.hasOwnProperty;
var extend = function(child, parent) {
  for (var key in parent) {
    if (hasProp.call(parent, key)) {
      child[key] = parent[key];
    }
  }
  /**
   * constructor
   */
  function Ctor() {
    this.constructor = child;
  }
  Ctor.prototype = parent.prototype;
  child.prototype = new Ctor();
  child.__super__ = parent.prototype;
  return child;
};
var bind = function(fn, me) {
  return function() {
    return fn.apply(me, arguments);
  };
};
sin = function(val) {
  return Math.sin(val);
};

cos = function(val) {
  return Math.cos(val);
};

abs = function(val) {
  return Math.abs(val);
};

pow = function(val, exp) {
  return Math.pow(val, exp);
};

sqrt = function(val) {
  return Math.sqrt(val);
};

sqr = function(val) {
  return pow(val, 2);
};

atan = function(val) {
  return Math.atan(val);
};

tan = function(val) {
  return Math.tan(val);
};

getMin = function(val, val2) {
  return Math.min(val, val2);
};

getMax = function(val, val2) {
  return Math.max(val, val2);
};

atan2 = function(valy, valx) {
  return Math.atan2(valy, valx);
};

floor = function(num) {
  return Math.floor(num);
};

ceil = function(num) {
  return Math.ceil(num);
};

round = function(num) {
  return Math.round(num);
};

pi = Math.PI;

isEven = function(value) {
  if (value % 2 === 0) {
    return true;
  }
  return false;
};

solveQuadratic = function(a, b, c) {
  var x1;
  var x2;
  if (pow(b, 2) - 4 * a * c < 0) {
    return false;
  }
  x1 = (-b + Math.sqrt(pow(b, 2) - 4 * a * c)) / (2 * a);
  x2 = (-b - Math.sqrt(pow(b, 2) - 4 * a * c)) / (2 * a);
  return [x1, x2];
};

getRandomInt = function(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
};

info = $("#info");

info2 = $("#info2");

info3 = $("#info3");

info4 = $("#info4");

jcan = $("canvas");

can = document.getElementById("canvas1");

ctxx = can.getContext("2d");

win = $(window);

jcan.attr("width", win.width() - 24);

jcan.attr("height", win.height() - 20);

requestAnimationFrame = window.requestAnimationFrame ||
 window.webkitRequestAnimationFrame ||
  window.mozRequestAnimationFrame ||
   window.oRequestAnimationFrame ||
    window.msRequestAnimationFrame;

cancelAnimationFrame = window.cancelAnimationFrame ||
 window.webkitCancelRequestAnimationFrame ||
  window.webkitCancelAnimationFrame ||
   window.mozCancelRequestAnimationFrame ||
    window.mozCancelAnimationFrame ||
     window.oCancelRequestAnimationFrame ||
      window.oCancelAnimationFrame ||
       window.msCancelRequestAnimationFrame ||
        window.msCancelAnimationFrame;

CanvasCenter = function() {
  this.x = jcan.width() / 2;
  this.y = jcan.height() / 2;
};

customChangePrototype = function(obj) {
  var prop;
  for (prop in obj) {
    if (obj.hasOwnProperty(prop)) {
      this[prop] = obj[prop];
    }
  }
};

plotItinerary = [];

plotting = function(number) {
  var i;
  var j;
  var len1;
  plotItinerary.push([plotItinerary.length, number]);
  if (plotItinerary.length > 100) {
    plotItinerary.shift();
    for (j = 0, len1 = plotItinerary.length; j < len1; j++) {
      i = plotItinerary[j];
      i[0]--;
    }
  }
  return $.plot($("#placeholder"), [plotItinerary], {
    yaxis: {
      max: 1,
      min: -1
    }
  });
};

makeid = function() {
  var j;
  var possible;
  var text;
  text = "";
  possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  for (j = 0; j < 5; j++) {
    text += possible.charAt(floor(Math.random() * possible.length));
  }
  return text;
};

Array.prototype.compare = function(array) {
  var i;
  var l;
  if (!array) {
    return false;
  }
  if (this.length !== array.length) {
    return false;
  }
  i = 0;
  l = this.length;
  while (i < l) {
    if (this[i] instanceof Array && array[i] instanceof Array) {
      if (!this[i].compare(array[i])) {
        return false;
      }
    } else if (this[i] !== array[i]) {
      return false;
    }
    i++;
  }
  return true;
};

Array.prototype.copy = function() {
  var i;
  var j;
  var k;
  var len1;
  k = [];
  for (j = 0, len1 = this.length; j < len1; j++) {
    i = this[j];
    k.push(i);
  }
  return k;
};

generateRandomColor = function(transparency) {
  var color, j;
  if (transparency == null) {
    transparency = getRandomInt(50, 100) / 100;
  }
  color = "rgba(";
  for (j = 1; j <= 3; j++) {
    color += getRandomInt(50, 255);
    color += ",";
  }
  color += transparency;
  color += ")";
  return color;
};

Button = (function() {
  /**
   * class Button: used to identify and properly use css buttons in the interface
   * @param {string} name1     name of the button
   * @param {string} selector  an activation string representing the jquery selector for the button, when clicked, it is activated
   * @param {string} selector2 an deactivation string representing the jquery selector for the button, when clicked, it is activated
   * @constructor
   */
  function Button(name1, selector, selector2) {
    this.name = name1;
    if (!this.name) {
      throw new Error("Error: Button doesn't have a proper name");
    }
    this.selector = [];
    this.type = null;
    if (selector) {
      this.setSelector(selector, selector2);
    }
    this.core = {
      activates: {},
      deactivates: {}
    };
    this.activated = false;
    return this;
  }

  Button.prototype.getType = function() {
    return this.type;
  };

  Button.prototype.makeSelector = function(val) {
    var selectionError;
    selectionError = "Error: missing or invalid Selector";
    if (!val) {
      throw new Error(selectionError);
    }
    if (typeof val !== "string") {
      throw new Error(selectionError);
    }
    return $(val);
  };

  Button.prototype.setSelector = function(val, val2) {
    if (!this.selector[0]) {
      this.selector.push(this.makeSelector(val));
    }
    val2 = val2 || val;
    if (!this.selector[1]) {
      this.selector.push(this.makeSelector(val2));
    }
    return this;
  };

  Button.prototype.findListener = function(group, listener) {
    var i, index, k;
    if (arguments.length === 1) {
      if ((k = this.findListener(this.core.activates, listener)) > 0) {
        return k;
      }
      return this.findListener(this.core.deactivates, listener);
    }
    for (i in group) {
      if (hasProp.call(group, i)) {
        index = group[i];
        if (i === listener) {
          return index;
        }
      }
    }
    return -1;
  };

  Button.prototype.setListener =
  function(listener, data, activation, deactivation) {
    var invalidationError, invalidationfn;
    if (!this.selector.length) {
      return;
    }
    invalidationError = "Error: invalid";
    if (!listener || typeof listener !== "string") {
      throw new Error(invalidationError + " listener");
    }
    if (typeof data !== "object") {
      throw new Error(invalidationError + " data assignment");
    }
    invalidationfn = invalidationError + " function assignment";
    if (activation === null && deactivation === null) {
      throw new Error(invalidationfn);
    }
    if (typeof activation !== "function" &&
     typeof deactivation !== "function") {
      throw new Error(invalidationfn);
    }
    if (activation) {
      this.assignActivation(listener, data, activation);
    }
    if (deactivation) {
      this.assignDeactivation(listener, data, deactivation);
    }
    return this;
  };

  Button.prototype.removeListener = function(listener) {
    if (this.findListener(this.core.activates, listener) !== -1) {
      this.selector[0].off(listener);
      delete this.core.activates[listener];
    }
    if (this.findListener(this.core.deactivates, listener) !== -1) {
      this.selector[1].off(listener);
      delete this.core.deactivates[listener];
    }
    return this;
  };

  Button.prototype.assignActivation = function(listener, data, original) {
    var fn;
    if (original) {
      fn = original.bind(null);
    }
    if (fn && data) {
      fn.data = data;
    }
    if (this.findListener(this.core.activates, listener) === -1) {
      this.core.activates[listener] = [];
      this.selector[0].on(listener, data, (function(_this) {
        return function(e) {
          return _this.activation(listener, e);
        };
      })(this));
    }
    if (fn) {
      this.core.activates[listener].push(fn);
    }
    return this;
  };

  Button.prototype.assignDeactivation = function(listener, data, original) {
    var fn;
    if (original) {
      fn = original.bind(null);
    }
    if (data) {
      fn.data = data;
    }
    if (this.findListener(this.core.deactivates, listener) === -1) {
      this.core.deactivates[listener] = [];
      this.selector[1].on(listener, data, (function(_this) {
        return function(e) {
          return _this.deactivation(listener, e);
        };
      })(this));
    }
    if (fn) {
      this.core.deactivates[listener].push(fn);
    }
    return this;
  };

  Button.prototype.activation = function(listener, e) {
    return this.activate(listener, e);
  };

  Button.prototype.deactivation = function(listener, e) {
    return this.deactivate(listener, e);
  };

  Button.prototype.activate = function(listener, e) {
    var eCopy, fn, i, j, len1, ref1;
    if (this.activated) {
      return;
    }
    if (!listener) {
      return ((function() {
        for (i in this.core.activates) {
          if (hasProp.call(this.core.activates, i)) {
            this.activate(i, e);
            this.activated = false;
          }
        }
        this.activated = true;
        return this;
      }).call(this));
    }
    ref1 = this.core.activates[listener];
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      fn = ref1[j];
      eCopy = Object.create(e || null);
      if (fn.data) {
        eCopy.data = fn.data;
      }
      fn.call(this, eCopy);
    }
    this.activated = true;
    return this;
  };

  Button.prototype.deactivate = function(listener, e) {
    var eCopy, fn, i, j, len1, ref1;
    if (!this.activated) {
      return;
    }
    if (!listener) {
      return ((function() {
        for (i in this.core.deactivates) {
          if (hasProp.call(this.core.deactivates, i)) {
            this.deactivate(i, e);
            this.activated = true;
          }
        }
        this.activated = false;
        return this;
      }).call(this));
    }
    ref1 = this.core.deactivates[listener];
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      fn = ref1[j];
      eCopy = Object.create(e || null);
      if (fn.data) {
        eCopy.data = fn.data;
      }
      fn.call(this, eCopy);
    }
    this.activated = false;
    return this;
  };

  return Button;
})();

Action = (function(superClass) {
  extend(Action, superClass);
  /**
   * class Action: a type of button that fires of an action once it is clicked
   * @param {string} name1     name of the button
   * @param {string} selector  an activation string representing the jquery selector for the button, when clicked, it is activated
   * @param {string} selector2 an deactivation string representing the jquery selector for the button, when clicked, it is activated
   * @constructor
   */
  function Action() {
    Action.__super__.constructor.apply(this, arguments);
    this.type = "action";
    return this;
  }

  Action.prototype.fire = function(listener, e) {
    this.activation(listener, e);
    return this;
  };

  Action.prototype.activation = function(listener, e) {
    this.activate(listener, e);
    return this.deactivation(null, e);
  };

  return Action;
})(Button);

Toggle = (function(superClass) {
  extend(Toggle, superClass);
  /**
   * class Toggle: a type of button when clicked once, activates, and when clicked again, deactivates
   * @param {string} name1     name of the button
   * @param {string} selector  an activation string representing the jquery selector for the button, when clicked, it is activated
   * @param {string} selector2 an deactivation string representing the jquery selector for the button, when clicked, it is activated
   * @constructor
   */
  function Toggle() {
    Toggle.__super__.constructor.apply(this, arguments);
    this.type = "toggle";
    return this;
  }

  Toggle.prototype.setListener = function(listener, data, activation,
     deactivation) {
    deactivation = deactivation || function() {
      return null;
    };
    activation = activation || function() {
      return null;
    };
    return Toggle.__super__.setListener.call(this, listener, data, activation,
       deactivation);
  };

  Toggle.prototype.toggle = function(listener, e) {
    this.activation(listener, e);
    return this;
  };

  Toggle.prototype.activation = function(listener, e) {
    if (this.activated) {
      return this.deactivate(listener, e);
    }
    return this.activate(listener, e);
  };

  Toggle.prototype.deactivation = function(listener, e) {
    return this;
  };

  Toggle.prototype.assignDeactivation = function(listener, data, fn) {
    Toggle.__super__.assignDeactivation.apply(this, arguments);
    return this.assignActivation(listener, data, null);
  };

  Toggle.prototype.assignActivation = function(listener, data, fn) {
    Toggle.__super__.assignActivation.apply(this, arguments);
    if (this.findListener(this.core.deactivates, listener) === -1) {
      return this.core.deactivates[listener] = [];
    }
  };

  return Toggle;
})(Button);

RadioOption = (function(superClass) {
  extend(RadioOption, superClass);
  /**
   * class RadioOption: an instance of a radio option button, mean to be used within an instance of a radio object
   * @param {string} name1     name of the button
   * @param {string} selector  an activation string representing the jquery selector for the button, when clicked, it is activated
   * @param {string} selector2 an deactivation string representing the jquery selector for the button, when clicked, it is activated
   * @constructor
   */
  function RadioOption() {
    RadioOption.__super__.constructor.apply(this, arguments);
    this.type = "radio option";
    return this;
  }

  RadioOption.prototype.select = function(listener, e) {
    return this.activate(listener, e);
  };

  RadioOption.prototype.deselect = function(listener, e) {
    return this.deactivate(listener, e);
  };

  return RadioOption;
})(Button);
Radio = (function(superClass) {
  extend(Radio, superClass);
  /**
  * class Radio: is an interface type that has sub options to click at. Once a single option has been activated,
  *    the remaining options are deactivated as a result, making sure only one option is selected at all times.
  * @param {string} name1     name of the button
  * @param {string} selector  an activation string representing the jquery selector for the button, when clicked, it is activated
  * @param {string} selector2 an deactivation string representing the jquery selector for the button, when clicked, it is activated
  * @constructor
  */
  function Radio() {
    this.options = [];
    Radio.__super__.constructor.apply(this, arguments);
    this.type = "radio";
  }

  Radio.prototype.setSelector = function(val) {
    var className, i, idName, j, name, prefix, ref1, selector;
    selector = this.makeSelector(val);
    for (i = 0; i < selector.length; i++) {
      className = selector.eq(i).attr("class");
      idName = selector.eq(i).attr("id");
      name = idName || className;
      prefix = idName ? "#" : ".";
      this.add(new RadioOption(name, prefix + name));
    }
    return this;
  };

  Radio.prototype.setListener =
  function(listener, data, activation, deactivation) {};

  Radio.prototype.add = function(option) {
    var originalFn, originalFn2;
    if (this.findOption(option)) {
      return;
    }
    if (!option.type || (option.type !== "radio option")) {
      throw new Error("Error: invalid option to add");
    }
    option.index = this.options.length;
    option.id = makeid();
    this.options.push(option);
    option.deselect();
    originalFn = option.assignActivation;
    option.assignActivation = (function(_this) {
      return function(listener, data, fn) {
        if (option.findListener(option.core.activates, listener) === -1) {
          option.selector[0].on(listener + ".adioInternal", data, function(e) {
            return _this.selectOption(option);
          });
        }
        return originalFn.apply(option, arguments);
      };
    })(this);
    originalFn2 = option.removeListener;
    return option.removeListener = (function(_this) {
      return function(listener) {
        if (option.findListener(option.core.deactivates, listener) !== -1) {
          option.selector[0].off(listener + ".adioInternal");
        }
        return originalFn2.apply(option, arguments);
      };
    })(this);
  };

  Radio.prototype.remove = function(option) {
    var foundOption, index, missingError;
    foundOption = this.findOption(option);
    missingError = "Error: option is missing or not found";
    if (!foundOption) {
      throw new Error(missingError);
    }
    index = foundOption.index;
    if (index > this.options.length - 1) {
      throw new Error(missingError);
    }
    option = this.options[index];
    this.options.splice(index, 1);
    return true;
  };

  Radio.prototype.selectOption = function(option) {
    var foundOption, i, j, len1, ref1;
    foundOption = this.findOption(option);
    if (!foundOption) {
      throw new Error("Error: option is missing or not found");
    }
    ref1 = this.options;
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      i.deselect();
    }
    return this;
  };

  Radio.prototype.getOption = function(index) {
    var k;
    if ((index == null) || index < 0 || index > this.options.length) {
      throw new Error("Error: index is not valid");
    }
    k = this.options[index];
    if (k) {
      return k;
    }
    return false;
  };

  Radio.prototype.getLength = function() {
    return this.options.length;
  };

  Radio.prototype.clicked = function() {
    var i, index, j, len1, ref1;
    ref1 = this.options;
    for (index = j = 0, len1 = ref1.length; j < len1; index = ++j) {
      i = ref1[index];
      if (i.activated) {
        return index;
      }
    }
    return false;
  };

  Radio.prototype.findOption = function(obj) {
    var i, id, invalidOption, j, len1, name, ref1, tag;
    invalidOption = "Error: input is not a valid option";
    if (!obj) {
      throw new Error(invalidOption);
    }
    id = obj.id == null ? null : obj.id;
    name = obj.name == null ? null : obj.name;
    tag = name == null ? "id" : "name";
    if (tag == null) {
      throw new Error(invalidOption);
    }
    for (j = 0; j < this.options.length; j++) {
      i = this.options[j];
      if (i[tag] === obj[tag]) {
        return i;
      }
    }
    return false;
  };

  return Radio;
})(Button);

Queue = (function() {
  /**
  * simple queue structure with "search" and "clear" functionality
  * @constructor
  */
  function Queue() {
    this.storage = [];
    this.size_ = 0;
  }

  Queue.prototype.queue = function(item) {
    if (!item) {
      return false;
    }
    this.size_++;
    this.storage.push(item);
    return true;
  };

  Queue.prototype.peek = function() {
    if (!this.size_) {
      return false;
    }
    return this.storage[this.size_ - 1];
  };

  Queue.prototype.search = function(key) {
    var i, j, len1, ref1;
    ref1 = this.storage;
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      if (i.compare(key)) {
        return i;
      }
    }
    return false;
  };

  Queue.prototype.get = function(index) {
    if (this.storage[index]) {
      return this.storage[index];
    }
    return null;
  };

  Queue.prototype.size = function() {
    return this.size_;
  };

  Queue.prototype.clear = function() {
    this.size_ = 0;
    this.storage = [];
  };

  Queue.prototype.dequeue = function() {
    if (!this.size_) {
      return false;
    }
    this.size_--;
    return this.storage.pop();
  };

  return Queue;
})();

Rope = (function() {
  /**
   * A rope that acts as a string between two shapes
   * @param {Shape} shape11 first shape
   * @param {Shape} shape21 second shape
   * @constructor
   */
  function Rope(shape11, shape21) {
    // this.shape1 = shape11 != null ? shape11 : null;
    this.shape1 = shape11 == null ? null : shape11;
    // this.shape2 = shape21 != null ? shape21 : null;
    this.shape2 = shape21 == null ? null : shape21;
    this.color = "grey";
  }

  Rope.prototype.line = function() {
    return new Line(this.shape1.physical.position,
      this.shape2.physical.position);
  };

  Rope.prototype.compare = function(S1, S2) {
    if (((S1 === this.shape1) && (S2 === this.shape2)) ||
     ((S2 === this.shape1) && (S1 === this.shape2))) {
      return true;
    }
    return false;
  };

  Rope.prototype.draw = function(width, color) {
    var m;
    if (width == null) {
      width = 1;
    }
    m = new Line(this.shape1.physical.position, this.shape2.physical.position);
    return m.draw(width, color || this.color);
  };

  return Rope;
})();

Engine = (function() {
  var topics;
  /**
   * The core engine of the physics engine. Renders the frames and implements a publisher/subscriber pattern
   * @constructor
   */
  function Engine() {
    this.request = {
      frame: true,
      animation: false
    };
    this.count = 0;
    this.shapes = [];
    this.lastLoop = new Date();
    this.thisLoop = null;
    this.leftOverTime = 0;
    this.accumulator = 0;
    this.ITERATIONS = 8 * 2;
    this.fpsCount = 1;
    this.dt = 1 / this.fpsCount;
    this.fpsNum = null;
    this.pageX = 0;
    this.pageY = 0;
    this.fps();
    this.update();
  }

  topics = {};

  Engine.prototype.emit = function(topic, info) {
    var i;
    var j;
    var len1;
    var len2;
    var p;
    var ref1;
    var results;
    var tempArr;
    if (!topics[topic] || !topics[topic].queue.length) {
      return;
    }
    ref1 = topics[topic].queue;
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      if (!i.fn) {
        continue;
      }
      i.fn.apply(i.scope, [topic, info]);
      if (i.fn.one) {
        tempArr = tempArr || [];
        i.fn.one = null;
        tempArr.push(i);
      }
    }
    if (tempArr) {
      results = [];
      for (p = 0, len2 = tempArr.length; p < len2; p++) {
        i = tempArr[p];
        results.push(this.off({
          topic: topic,
          fn: i.fn
        }));
      }
      return results;
    }
  };

  Engine.prototype.on = function(topic, fn, scope, name) {
    var index;
    if (!topics[topic]) {
      topics[topic] = {
        queue: []
      };
    }
    if (!fn.id) {
      fn.id = makeid();
    }
    if (this.find(topic, fn.id)) {
      throw new Error("duplicates");
    }
    index = topics[topic].queue.push({
      fn: fn,
      scope: scope || null,
      name: name
    }) - 1;
  };

  Engine.prototype.findByTopic = function(topic, id) {
    var index, j, len1, obj, ref1;
    ref1 = topics[topic].queue;
    for (index = j = 0, len1 = ref1.length; j < len1; index = ++j) {
      obj = ref1[index];
      if (obj.fn.id === id) {
        return {
          index: index,
          obj: obj
        };
      }
    }
    return false;
  };

  Engine.prototype.find = function(topic, id) {
    var i, k;
    if (topic === true) {
      for (i in topics) {
        if (hasProp.call(topics, i)) {
          k = this.findByTopic(i, id);
          if (k) {
            return k;
          }
        }
      }
      return false;
    }
    return this.findByTopic(topic, id);
  };

  Engine.prototype.off = function(obj) {
    var id_, result;
    if (!topics[obj.topic] || !topics[obj.topic].queue.length) {
      return;
    }
    id_ = obj.fn ? obj.fn.id : obj.id;
    if (!(result = this.find(obj.topic, id_))) {
      return result;
    }
    return topics[obj.topic].queue.splice(result.index, 1);
  };

  Engine.prototype.one = function(topic, fn, scope, name) {
    fn.one = true;
    return this.on.apply(this, arguments);
  };

  Engine.prototype.setupInput = function(type) {
    return this.input = {
      type: type
    };
  };

  Engine.prototype.resetInput = function() {
    return this.input = null;
  };

  Engine.prototype.fps = function() {
    this.thisLoop = new Date().getTime();
    this.accumulator += this.thisLoop - this.lastLoop;
    this.elapsedTime = this.thisLoop - this.lastLoop;
    this.lastLoop = this.thisLoop;
    this.fpsNum = 1000 / this.accumulator;
    return $("#fps").html(ceil(this.fpsNum));
  };

  Engine.prototype.implement = function(item) {
    this.shapes.push(item);
    return this.emit("implement", {
      shape: item,
      index: this.shapes.length - 1,
      shapes: this.shapes,
      engine: this
    });
  };

  Engine.prototype.checkWall = function(shape) {
    var base, bound, constant, product, vel;
    vel = shape.get("v");
    bound = shape.get("bounding");
    constant = 1.8;
    if (bound[0].x > jcan.width()) {
      if ((product = vel.dot(base = new Vector(1, 0))) > 0) {
        vel.move(base.scale(-product * constant));
      }
    }
    if (bound[1].x < 0) {
      if ((product = vel.dot(base = new Vector(-1, 0))) > 0) {
        vel.move(base.scale(-product * constant));
      }
    }
    if (bound[0].y > jcan.height()) {
      if ((product = vel.dot(base = new Vector(0, 1))) > 0) {
        vel.move(base.scale(-product * constant));
      }
    }
    if (bound[1].y < 0) {
      if ((product = vel.dot(base = new Vector(0, -1))) > 0) {
        return vel.move(base.scale(-product * constant));
      }
    }
  };

  Engine.prototype.animate = function() {
    var i, i1, j, len1, len2, p, q, ref1, ref2, ref3, results;
    this.emit("animate", {
      timestep: this.dt,
      cursor: new Vector(this.pageX, this.pageY),
      engine: this
    });
    // for (j = 0, ref1 = this.ITERATIONS; 0 <= ref1 ? j < ref1 : j > ref1; 0 <= ref1 ? j++ : j--) {
    for (j = 0; j < this.ITERATIONS; j++) {
      this.emit("iterate", {
        timestep: this.dt,
        cursor: new Vector(this.pageX, this.pageY),
        engine: this
      });
      for (i1 = 0; i1 < this.shapes.length; i1++) {
        i = this.shapes[i1];
        i.integrate(this.dt);
      }
    }
    ref3 = this.shapes;
    results = [];
    for (q = 0, len2 = ref3.length; q < len2; q++) {
      i = ref3[q];
      results.push(this.checkWall(i));
    }
    return results;
  };

  Engine.prototype.draw = function() {
    var i, j, len1, ref1, results;
    ctxx.clearRect(0, 0, jcan.width(), jcan.height());
    ref1 = this.shapes;
    results = [];
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      results.push(i.draw(ctxx));
    }
    return results;
  };

  Engine.prototype.update = function() {
    var that;
    that = that == null ? this : that;
    that.fps();
    this.draw();
    if (this.accumulator > this.dt * 1.2) {
      this.accumulator = this.dt * 1.2;
    }
    while (this.accumulator > this.dt) {
      this.emit("update", {
        timestep: this.dt,
        cursor: new Vector(this.pageX, this.pageY),
        engine: this
      });
      this.accumulator -= this.dt;
    }
    return setTimeout(function() {
      if (that.request.frame === true) {
        return requestAnimationFrame(function() {
          return that.update();
        });
      }
    }, 0);
  };

  return Engine;
})();

Behaviour = (function() {
  /**
   * class Behaviour: adds different behaviours upon user interaction with the engine
   *    set: set its parameters in which the behaviour is going to function
   *    update: affects the world for the behaviour to be achieved
   *    active: boolean - displays whether the behaviour is running
   *    activate: activates the behaviour
   *    deactivate: deactivates the behaviour
   * @constructor
   */
  function Behaviour() {
    var args;
    this.active = false;
    this.isSet = false;
    args = arguments[0];
  }

  Behaviour.prototype.activate = function(engine1, trigger, action) {
    this.engine = engine1;
    this.trigger = trigger;
    this.action = action == null ? "apply" : action;
    this.engine.on(this.trigger, this[this.action], this);
    return this.active = true;
  };

  Behaviour.prototype.deactivate = function() {
    this.reset(true, {
      engine: this.engine
    });
    this.engine.off({
      topic: this.trigger,
      fn: this[this.action]
    });
    return this.active = false;
  };

  Behaviour.prototype.isActivated = function() {
    return this.active;
  };

  Behaviour.prototype.set = function(mode) {
    if (!mode) {
      throw new Error("Error: Undefined Mode or required parameter");
    }
    if (!this.isSet) {
      return this.isSet = true;
    }
  };

  Behaviour.prototype.apply = function(event, info) {
    var engine, key, ref1, ref2, results, value;
    engine = info.engine;
    if (!this.isSet) {
      throw new Error("not set");
    }
    for (key in this.updates) {
      if (hasProp.call(this.updates, key)) {
        value = this.updates[key];
        engine.on(key, value[0], value[1], key);
      }
    }
    results = [];
    for (key in this.resets) {
      if (hasProp.call(this.resets, key)) {
        value = this.resets[key];
        results.push(engine.one(key, value[0], value[1], key));
      }
    }
    return results;
  };

  Behaviour.prototype.reset = function(event, info) {
    var engine, key, ref1, ref2, results, value;
    engine = info.engine;
    for (key in this.updates) {
      if (hasProp.call(this.updates, key)) {
        value = this.updates[key];
        engine.off({
          topic: key,
          fn: value[0]
        });
      }
    }
    for (key in this.resets) {
      if (hasProp.call(this.resets, key)) {
        value = this.resets[key];
        if (key === event) {
          continue;
        }
        engine.off({
          topic: key,
          fn: value[0]
        });
      }
    }
  };

  Behaviour.prototype.getType = function(shape) {
    var name;
    name = shape.type;
    if (!name || ((name !== "Rectangle") && (name !== "Circle") &&
      (name !== "Shape"))) {
      throw new Error("name not available");
    }
    return shape.type;
  };

  return Behaviour;
})();

Collision = (function(superClass) {
  extend(Collision, superClass);
  /**
   * class Collision: a template for other collision detectors/solvers
   * @param {Array} checks the array of checks that act as events that when triggered, they call the update function to this class
   * @constructor
   */
  function Collision(checks) {
    var i, j;
    Collision.__super__.constructor.apply(this, arguments);
    this.updates = {};
    for (j = 0; j < checks.length; j++) {
      i = checks[j];
      this.updates[i] = [this.update, this];
    }
    this.set(true);
  }

  Collision.prototype.activate = function(engine) {
    this.apply(null, {
      engine: engine
    });
    return this.active = true;
  };

  Collision.prototype.deactivate = function() {
    this.reset(true, {
      engine: this.engine
    });
    return this.active = false;
  };

  Collision.prototype.update = function() {};

  return Collision;
})(Behaviour);

CollisionControl = (function(superClass) {
  extend(CollisionControl, superClass);
  /**
   * class CollisionControl: checks all pairs of shapes to see if shapes collided
   * @constructor
   */
  function CollisionControl() {
    CollisionControl.__super__.constructor.apply(this, arguments);
  }

  CollisionControl.prototype.activate = function(engine) {
    return this.apply(engine);
  };

  CollisionControl.prototype.deactivate = function() {
    return CollisionControl.__super__.deactivate.apply(this, arguments);
  };

  CollisionControl.prototype.apply = function(engine) {
    return engine.on("iterate", function() {
      var i, i1, n, n1;
      for (i1 = 0; i1 < engine.shapes.length; i1++) {
        i = engine.shapes[i1];
        var len2, p, ref2;
        for (n1 = 0; n1 < engine.shapes.length; n1++) {
          n = engine.shapes[n1];
          if (n1 <= i1) {
            continue;
          }
          if (!(n.get("invM") || i.get("invM"))) {
            continue;
          }
          engine.emit("checkColl: " + this.getType(i) + " - " + this.getType(n),
            {
              A: i,
              B: n,
              engine: engine
            }
          );
        }
      }
    }, this);
  };

  return CollisionControl;
})(Behaviour);

AABB = (function(superClass) {
  extend(AABB, superClass);
  /**
   * class AABB: checks if shapes are inside one another through the AABB rectangle
   * @constructor
   */
  function AABB() {
    AABB.__super__.constructor.call(this, ["checkColl: Rectangle - Circle",
     "checkColl: Circle - Rectangle",
      "checkColl: Rectangle - Rectangle",
       "checkColl: Circle - Circle"]);
  }

  AABB.prototype.update = function(event, data) {
    var a, b, engine, i, j, n;
    a = data.A;
    b = data.B;
    engine = data.engine;
    if (!(this.inside(a, b) || this.inside(b, a))) {
      return;
    }
    for (j = 0; j < a.shapes.length; j++) {
      i = a.shapes[j];
      for (var p = 0; p < b.shapes.length; p++) {
        n = b.shapes[p];
        engine.emit("AABB: " + this.getType(i) + " - " + this.getType(n), {
          A: i,
          B: n,
          engine: engine
        });
      }
    }
  };

  AABB.prototype.inside = function(shape1, shape2) {
    var b1, b2;
    b1 = shape1.get("bounding");
    b2 = shape2.get("bounding");
    // defining upper and lower bounds for readability
    var b1UpperX = b1[0].x;
    var b2UpperX = b2[0].x;
    var b1UpperY = b1[0].y;
    var b2UpperY = b2[0].y;
    var b1LowerX = b1[1].x;
    var b2LowerX = b2[1].x;
    var b1LowerY = b1[1].y;
    var b2LowerY = b2[1].y;
    var b1BetweenB2OnX = ((b2LowerX <= b1UpperX) && (b1UpperX <= b2UpperX));
    var b2BetweenB1OnX = ((b1LowerX <= b2UpperX) && (b2UpperX <= b1UpperX));
    var b1BetweenB2OnY = ((b2LowerY <= b1UpperY) && (b1UpperY <= b2UpperY));
    var b2BetweenB1OnY = ((b1LowerY <= b2UpperY) && (b2UpperY <= b1UpperY));

    if (b1BetweenB2OnX || b2BetweenB1OnX) {
      if (b1BetweenB2OnY || b2BetweenB1OnY) {
        return true;
      }
    }
    return false;
  };

  return AABB;
})(Collision);

GJK = (function(superClass) {
  var EdgePoints, ranking, separation, simplexPoint, tripleCross;
  extend(GJK, superClass);
  /**
  * class GJK: Uses the GJK algorithm to find the collision between two polygons
  * @constructor
  */
  function GJK() {
    /*
        "AABB: Rectangle - Circle"
        "AABB: Circle - Rectangle"
        "AABB: Rectangle - Rectangle"
        "AABB: Circle - Circle"
     */
    GJK.__super__.constructor.call(this, ["AABB: Shape - Shape"]);
  }

  GJK.prototype.simplex = function(shape1, shape2) {
    var direction, getLatestPt, safeguard, simplexPoints, supportFn;
    simplexPoints = [];
    safeguard = 0;
    supportFn = this.doSupport.bind(this, shape1, shape2);
    getLatestPt = function() {
      return simplexPoints[simplexPoints.length - 1];
    };
    direction = shape1.get("position").subtract(shape2.get("position"));
    direction = direction.add(direction.normal().scale(0.5));
    simplexPoints.push(supportFn(direction));
    direction = direction.scale(-1);
    while (safeguard++ < 10) {
      if (safeguard >= 10) {
        return false;
      }
      simplexPoints.push(supportFn(direction));
      if (abs(getLatestPt().x) < 0.1 && abs(getLatestPt().y) < 0.1) {
        return false;
      }
      if (direction.dot(getLatestPt()) <= 0) {
        return false;
      }
      if (this.containsOrigin(simplexPoints, direction)) {
        return separation(simplexPoints, supportFn);
      }
    }
    return false;
  };

  GJK.prototype.containsOrigin = function(points, direction) {
    var a, ab, abPerp, ac, acPerp, ao, b, c, result;
    if (points.length === 3) {
      a = points[2];
      b = points[1];
      c = points[0];
      ab = b.subtract(a);
      ac = c.subtract(a);
      ao = a.scale(-1);
      abPerp = tripleCross(ac, ab, ab);
      acPerp = tripleCross(ab, ac, ac);
      if (abPerp.dot(ao) > 0) {
        points.splice(0, 1);
      } else if (acPerp.dot(ao) > 0) {
        points.splice(1, 1);
      } else {
        return true;
      }
    }
    if (points.length === 2) {
      a = points[1];
      b = points[0];
      ab = b.subtract(a);
      ao = a.scale(-1);
      result = tripleCross(ab, ao, ab);
      direction.equal(result);
      return false;
    }
  };

  separation = function(points, supportFn) {
    var direction, first, firstPlace, firstPlaces, i, i1, n, n1, newPoint, p1,
      p2, rankingQueue, safeguard, second, temp, third;
    safeguard = 0;
    first = {
      p1: null,
      p2: null,
      normal: null,
      length: null,
      ratio: null
    };
    second = {
      p1: null,
      p2: null,
      normal: null,
      length: null,
      ratio: null
    };
    third = {
      p1: null,
      p2: null,
      normal: null,
      length: null,
      ratio: null
    };
    rankingQueue = [first, second, third];
    firstPlaces = [];
    for (i1 = 0; i1 < points.length; i1++) {
      i = points[i1];
      n1 = (i1 + 1 === points.length ? 0 : i1 + 1);
      n = points[n1];
      temp = new EdgePoints(i, n, points);
      ranking(temp, rankingQueue);
    }
    while (safeguard++ < 10) {
      if (safeguard > 10) {
        throw new Error("are you sure?");
      }
      firstPlace = rankingQueue[0];
      p1 = firstPlace.p1;
      p2 = firstPlace.p2;
      direction = firstPlace.normal;
      if (supportFn) {
        newPoint = supportFn(direction);
      }
      if (abs(direction.dot(newPoint) - direction.dot(p1)) < 0.1 ||
       abs(direction.dot(newPoint) - direction.dot(p2)) < 0.1) {
        return firstPlace;
      }
      rankingQueue.splice(0, 1);
      rankingQueue.push(third);
      ranking(new EdgePoints(p1, newPoint, points), rankingQueue);
      ranking(new EdgePoints(newPoint, p2, points), rankingQueue);
    }
    return false;
  };

  ranking = function(edgePoint, rankings) {
    var index, item, rank, temp;
    item = edgePoint;
    for (index = 0; index < rankings.length; index++) {
      rank = rankings[index];
      if (rank.normal === null) {
        rankings[index] = item;
        break;
      }
      if (edgePoint.length < rank.length) {
        temp = rankings[index];
        rankings[index] = item;
        item = temp;
        continue;
      }
    }
    return rankings;
  };

  EdgePoints = function(p11, p21, simplex) {
    var a, ab, abDotAb, ao, b;
    this.p1 = p11;
    this.p2 = p21;
    this.simplex = simplex;
    a = this.p1;
    b = this.p2;
    ab = b.subtract(a);
    ao = a.scale(-1);
    abDotAb = ab.dot(ab);
    if (abDotAb === 0) {
      console.log(this);
      throw new Error("it is a zero!");
    }
    this.ratio = ao.dot(ab) / abDotAb;
    this.normal = tripleCross(ao, ab, ab).scale(1 / abDotAb);
    if (this.ratio < 0) {
      this.normal = a;
    }
    if (this.ratio > 1) {
      this.normal = b;
    }
    this.length = this.normal.dot(this.normal);
    return this;
  };

  tripleCross = function(a, b, c) {
    return b.scale(c.dot(a)).subtract(a.scale(c.dot(b)));
  };

  simplexPoint = function(k1, k2) {
    var vector;
    vector = k1.subtract(k2);
    vector.p1 = k1;
    vector.p2 = k2;
    return vector;
  };

  GJK.prototype.doSupport = function(a, b, dir) {
    return simplexPoint(a.support(dir), b.support(dir.scale(-1)));
  };

  GJK.prototype.getManifolds = function(mtv, initial) {
    var edgeVec, i, index, j, len1, max, maxVec, min, minVec, stack, temp;
    if (!(!(mtv.p1.p1 === mtv.p2.p1) && !(mtv.p1.p2 === mtv.p2.p2))) {
      return;
    }
    max = -Infinity;
    maxVec = null;
    min = Infinity;
    minVec = null;
    edgeVec = mtv.p1.p1.subtract(mtv.p2.p1);
    stack = initial || [mtv.p1.p1, mtv.p2.p1, mtv.p1.p2, mtv.p2.p2];
    for (index = j = 0, len1 = stack.length; j < len1; index = ++j) {
      i = stack[index];
      temp = i.dot(edgeVec);
      if (temp > max) {
        max = temp;
        maxVec = index;
      }
      if (temp < min) {
        min = temp;
        minVec = index;
      }
    }
    stack.splice(getMax(maxVec, minVec), 1);
    stack.splice(getMin(maxVec, minVec), 1);
    return stack;
  };

  GJK.prototype.getNormals = function(normals, vec) {
    var i, index, j, len1, max, maxVec, temp;
    max = -Infinity;
    maxVec = null;
    for (index = j = 0, len1 = normals.length; j < len1; index = ++j) {
      i = normals[index];
      temp = i.dot(vec);
      if (temp > max) {
        max = temp;
        maxVec = index;
      }
    }
    if (maxVec != null) {
      return normals[maxVec];
    }
    return false;
  };

  GJK.prototype.update = function(event, data) {
    var a, aP, b, bP, closestA, closestB, engine, i, j, lambda1, lambda2,
      manifoldation, mtv, norm, obj, s1, s2, temp, vec;
    a = data.A;
    b = data.B;
    engine = data.engine;
    mtv = this.simplex(a, b);
    if (!mtv) {
      return;
    }
    manifoldation = [];
    norm = null;
    vec = mtv.normal.scale(-1);
    aP = mtv.p1;
    bP = mtv.p2;
    s1 = "p2";
    s2 = "p1";
    lambda2 = mtv.ratio;
    lambda1 = 1 - lambda2;
    if (lambda1 < 0) {
      closestA = bP.p1;
      closestB = bP.p2;
    } else if (lambda2 < 0) {
      closestA = aP.p1;
      closestB = aP.p2;
    }
    closestA = aP[s1].scale(lambda1).add(bP[s1].scale(lambda2));
    closestB = aP[s2].scale(lambda1).add(bP[s2].scale(lambda2));
    manifoldation.push(new Line(closestA, closestB).middle());
    temp = {};
    temp.norm = this.getNormals(a.get("norms").concat(b.get("norms")), vec);
    temp.manifold = this.getManifolds(mtv);
    if (temp.norm) {
      norm = temp.norm;
    }
    if (!norm) {
      norm = vec.unit();
    }
    if (temp.manifold) {
      manifoldation = temp.manifold;
    }
    obj = {
      vector: [],
      normal: norm.copy(),
      manifold: manifoldation
    };
    for (j = 0; j < manifoldation.length; j++) {
      i = manifoldation[j];
      obj.vector.push(vec);
    }
    engine.emit("collided: " + this.getType(a) + " - " + this.getType(b), {
      cursor: new Vector(engine.pageX, engine.pageY),
      a: a,
      b: b,
      engine: this.engine,
      collision: obj
    });
  };

  return GJK;
})(Collision);

SATColl = (function(superClass) {
  extend(SATColl, superClass);
  /**
   * class SATColl: Uses the SAT algorithm to find the collision between two polygons
   * @constructor
   */
  function SATColl() {
    /*
    "AABB: Rectangle - Circle"
    "AABB: Circle - Rectangle"
    "AABB: Rectangle - Rectangle"
    "AABB: Circle - Circle"
    */
    SATColl.__super__.constructor.call(this, ["AABB: Shape - Shape"]);
  }

  SATColl.prototype.getShapeType = function(shape) {
    return shape.shapeType;
  };

  SATColl.prototype.getAxies = function(a, b) {
    var i, j, len1, len2, p, ref1, ref2, result, temp, typeA, typeB;
    typeA = this.getShapeType(a);
    typeB = this.getShapeType(b);
    result = [];
    if (typeA === "Circle") {
      temp = this.circleAxis(a, b);
      if (temp.length) {
        result = result.concat(temp);
      }
    }
    if (typeB === "Circle") {
      temp = this.circleAxis(b, a);
      if (temp.length) {
        result = result.concat(temp);
      }
    }
    ref1 = a.get("norms");
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      result.push(i);
    }
    ref2 = b.get("norms");
    for (p = 0, len2 = ref2.length; p < len2; p++) {
      i = ref2[p];
      result.push(i);
    }
    return result;
  };

  SATColl.prototype.circleAxis = function(circ, nonCirc) {
    var i, j, k, len1, pos, ref1, result, vec;
    if (this.getShapeType(nonCirc) === "Circle") {
      k = circ.get("position").subtract(nonCirc.get("position"));
      k.getLength();
      return [k.unit()];
    }
    pos = circ.get("position");
    result = [];
    ref1 = nonCirc.get("verticies");
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      vec = pos.subtract(i);
      vec.getLength();
      result.push(vec.unit());
    }
    return result;
  };

  SATColl.prototype.removeDuplicateAxis = function(axises) {
    var booli, i, i1, j, len1, len2, n, n1, p, removals;
    removals = [];
    for (i1 = j = 0, len1 = axises.length; j < len1; i1 = ++j) {
      i = axises[i1];
      booli = false;
      for (n1 = p = 0, len2 = axises.length; p < len2; n1 = ++p) {
        n = axises[n1];
        if (n1 <= i1) {
          continue;
        }
        if (booli) {
          continue;
        }
        if (abs(abs(i.dot(n)) - 1) < 0.0000001) {
          booli = true;
        }
      }
      if (!booli) {
        removals.push(i);
      }
    }
    return removals;
  };

  SATColl.prototype.projectShape = function(shape, axis, booli) {
    var dot, support;
    if (booli == null) {
      throw new Error("no booli");
    }
    support = shape.support(axis);
    dot = support.subtract(shape.get("position")).dot(axis);
    if (booli) {
      return dot;
    }
    return axis.scale(dot);
  };

  SATColl.prototype.optimizedSAT = function(shape1, shape2) {
    var axis, dist, index, j, len1, minAxis, minIndex, minLength, proj1, proj2,
      projectAxis, relation, result, totalAxises;
    relation = shape2.get("position").subtract(shape1.get("position"));
    totalAxises = this.getAxies(shape1, shape2);
    totalAxises = this.removeDuplicateAxis(totalAxises);
    minIndex = null;
    minLength = Infinity;
    for (index = j = 0, len1 = totalAxises.length; j < len1; index = ++j) {
      axis = totalAxises[index];
      if (axis.length !== 1) {
        throw new Error("not unit vector");
      }
      projectAxis = relation.dot(axis);
      if (projectAxis < 0) {
        projectAxis *= -1;
        axis = totalAxises[index] = axis.scale(-1);
      }
      proj1 = this.projectShape(shape1, axis, true);
      proj2 = this.projectShape(shape2, axis.scale(-1), true);
      dist = (proj1 + proj2) - projectAxis;
      if (dist < 0) {
        return false;
      }
      if (dist < minLength) {
        minLength = dist;
        minIndex = index;
      }
    }
    if (minIndex == null) {
      throw new Error("no index!");
    }
    minAxis = totalAxises[minIndex];
    projectAxis = relation.projection(minAxis);
    proj1 = this.projectShape(shape1, minAxis, false);
    proj2 = this.projectShape(shape2, minAxis.scale(-1), false);
    if (proj1.dot(proj2) > 0) {
      throw new Error("projections arent opposite");
    }
    if (proj1.dot(projectAxis) < 0) {
      projectAxis = projectAxis.scale(-1);
    }
    result = projectAxis.subtract(proj1).add(proj2);
    result.length = abs(minAxis.dot(result));
    return result;
  };

  SATColl.prototype.closestEdge = function(shape, dir) {
    var edge1, edge2, otherPoint, point, result;
    point = shape.support(dir);
    if (!point.edge1 || !point.edge2) {
      return {
        type: "vector",
        edge: point
      };
    }
    edge1 = point.edge1;
    edge2 = point.edge2;
    if (abs(edge1.vector().unit().dot(dir)) <=
     abs(edge2.vector().unit().dot(dir))) {
      otherPoint = edge1.p1 === point ? edge1.p2 : edge1.p1;
      result = new Line(point, otherPoint);
      result.length = edge1.length;
      return {
        type: "edge",
        edge: result,
        support: point
      };
    }
    otherPoint = edge2.p1 === point ? edge2.p2 : edge2.p1;
    result = new Line(point, otherPoint);
    result.length = edge2.length;
    return {
      type: "edge",
      edge: result,
      support: point
    };
  };

  SATColl.prototype.getManifold = function(a, b, normal) {
    var cp, edgeA, edgeB, flip, inc, max, o, p1, p2, ref, refVec;
    edgeA = this.closestEdge(a, normal);
    edgeB = this.closestEdge(b, normal.scale(-1));
    if (edgeA.type === "vector") {
      return {
        points: [edgeA.edge],
        flip: false
      };
    }
    if (edgeB.type === "vector") {
      return {
        points: [edgeB.edge],
        flip: false
      };
    }
    flip = false;
    if (abs(edgeA.edge.vector().unit().dot(normal)) <=
     abs(edgeB.edge.vector().unit().dot(normal))) {
      ref = edgeA;
      inc = edgeB;
    } else {
      ref = edgeB;
      inc = edgeA;
      flip = true;
    }
    p1 = inc.edge.p1;
    p2 = inc.edge.p2;
    refVec = ref.edge.vector().unit();
    o = refVec.dot(ref.edge.p1);
    cp = this.clippling(p1, p2, refVec, o);
    if (cp.length < 2) {
      return false;
    }
    refVec = refVec.scale(-1);
    o = refVec.dot(ref.edge.p2);
    cp = this.clippling(cp[0], cp[1], refVec, o);
    if (cp.length < 2) {
      return false;
    }
    normal = normal.scale(-1);
    if (flip) {
      normal = normal.scale(-1);
    }
    max = normal.dot(ref.support);
    cp[0].depth = normal.dot(cp[0]) - max;
    cp[1].depth = normal.dot(cp[1]) - max;
    if (cp[1].depth < 0) {
      cp.splice(1, 1);
    }
    if (cp[0].depth < 0) {
      cp.splice(0, 1);
    }
    return {
      points: cp,
      flip: flip
    };
  };

  SATColl.prototype.clippling = function(p1, p2, ref, o) {
    var cp, d1, d2, e, u;
    cp = [];
    d1 = p1.dot(ref) - o;
    d2 = p2.dot(ref) - o;
    if (d1 >= 0) {
      cp.push(p1);
    }
    if (d2 >= 0) {
      cp.push(p2);
    }
    if ((d1 * d2) < 0) {
      e = p2.subtract(p1);
      u = d1 / (d1 - d2);
      cp.push(e.scale(u).add(p1));
    }
    return cp;
  };

  SATColl.prototype.update = function(event, data) {
    var a, b, collision, engine, i, j, len1, manifoldation, mtv, ref1;
    a = data.A;
    b = data.B;
    engine = data.engine;
    mtv = this.optimizedSAT(a, b);
    if (!mtv) {
      return;
    }
    collision = {
      normal: mtv.unit()
    };
    manifoldation = this.getManifold(b, a, collision.normal);
    if (!manifoldation.points) {
      return;
    }
    collision.manifold = manifoldation.points;
    collision.vector = [mtv, mtv];
    ref1 = collision.manifold;
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      collision.vector.push(collision.normal.scale(i.depth));
      collision.vector.splice(0, 1);
    }
    return engine.emit(
      "collided: " + this.getType(a) + " - " + this.getType(b),
      {
        cursor: new Vector(engine.pageX, engine.pageY),
        a: a,
        b: b,
        engine: this.engine,
        collision: collision
      }
    );
  };

  return SATColl;
})(Collision);

ImpulseResolution = (function(superClass) {
  extend(ImpulseResolution, superClass);
  /**
  * class ImpulseResolution: Pushes away two polygons by adding the appropriate force and torque
  * @constructor
  */
  function ImpulseResolution() {
    ImpulseResolution.__super__.constructor.call(this,
      ["collided: Rectangle - Circle",
       "collided: Circle - Rectangle",
        "collided: Rectangle - Rectangle",
         "collided: Circle - Circle",
          "collided: Circle - Shape",
           "collided: Shape - Circle",
            "collided: Shape - Shape",
             "collided: Shape - Rectangle",
              "collided: Rectangle - Shape"]);
  }

  ImpulseResolution.prototype.calculateImpulse4 =
  function(A, B, contact, contactsLength, CollisionV, normal) {
    var Or, angVelA, angVelB, contactVel, df, e, impulse, invMassA, invMassB,
      invMassSum, invMoiA, invMoiB, jt, mr, n, perp, rA, rB, raCrossN, raCrossT,
      rbCrossN, rbCrossT, rv, sf, sign, t, tangentImpulse;
    rA = contact.subtract(A.get("position"));
    rB = contact.subtract(B.get("position"));
    angVelA = A.get("rv");
    angVelB = B.get("rv");
    invMassA = A.get("invM");
    invMassB = B.get("invM");
    invMoiA = A.get("invI");
    invMoiB = B.get("invI");
    n = normal.scale(-1);
    perp = n.normal();
    mr = A.get("restitution");
    Or = B.get("restitution");
    e = mr * Or;
    sf = A.get("sf") * B.get("sf");
    df = A.get("df") * B.get("df");
    rv = B.get("v").add(rB.scaleCross(-angVelB)).subtract(A.get("v")).subtract(
      rA.scaleCross(-angVelA));

    /*
    rv = rv.add B.get("force").add(rB.scaleCross(-B.get("torque")))
        .subtract(A.get("force")).subtract(rA.scaleCross(-A.get("torque")))
     */
    contactVel = rv.dot(n);
    if (contactVel >= 0) {
      return false;
    }
    raCrossN = -rA.cross(n);
    rbCrossN = -rB.cross(n);
    invMassSum = invMassA + invMassB + sqr(raCrossN) * invMoiA +
     sqr(rbCrossN) * invMoiB;
    impulse = contactVel * (-(1 + e));
    impulse /= invMassSum;
    impulse /= contactsLength;
    B.applyForce(n.scale(impulse), rB.add(B.get("position")));
    A.applyForce(n.scale(-impulse), rA.add(A.get("position")));
    t = perp;
    raCrossT = -rA.cross(t);
    rbCrossT = -rB.cross(t);
    invMassSum = invMassA + invMassB + sqr(raCrossT) * invMoiA +
     sqr(rbCrossT) * invMoiB;
    jt = -rv.dot(t);
    jt /= invMassSum;
    sign = rv.dot(t) < 0 ? -1 : 1;
    impulse *= sign;
    tangentImpulse = abs(jt) < impulse * sf ?
     t.scale(jt) : t.scale(-impulse * df);
    B.applyForce(tangentImpulse, rB.add(B.get("position")));
    return A.applyForce(tangentImpulse.scale(-1), rA.add(A.get("position")));
  };

  ImpulseResolution.prototype.positionalCorrection =
  function(percentages, mainShape, otherShape, penetrationDepth, invMasses) {
    var correction, k, percentage;
    percentage = percentages || 0.4;
    if ((k = penetrationDepth.length) < 0.5) {
      percentage = 0;
    }
    if (penetrationDepth.length == null) {
      throw new Error("no positional correction");
    }
    correction = penetrationDepth.scale(percentage / invMasses);
    mainShape.move(correction.scale(mainShape.get("invM")));
    return otherShape.move(correction.scale(-otherShape.get("invM")));
  };

  ImpulseResolution.prototype.impulseResolve = function(A, B, Collision) {
    var CollisionV, contacts, correction, i, i1, invMasses, j, normal, results;
    if (!(invMasses = A.get("invM") + B.get("invM"))) {
      return new Vector();
    }
    CollisionV = Collision.vector[0];
    normal = Collision.normal || CollisionV.unit();
    contacts = Collision.manifold;
    correction = this.positionalCorrection(null, A, B, CollisionV, invMasses);
    results = [];
    for (i1 = 0; i1 < contacts.length; i1++) {
      i = contacts[i1];
      results.push(this.calculateImpulse4(A, B, i, contacts.length,
         Collision.vector[i1], normal));
    }
    return results;
  };

  ImpulseResolution.prototype.update = function(event, data) {
    var a, b, collision, engine;
    a = data.a;
    b = data.b;
    if (this.getType(a) === "Shape") {
      a = a.body;
    }
    if (this.getType(b) === "Shape") {
      b = b.body;
    }
    collision = data.collision;
    engine = data.engine;
    if (!(a.get("invM") || b.get("invM"))) {
      return;
    }
    return this.impulseResolve(a, b, collision);
  };

  return ImpulseResolution;
})(Collision);

Mouse = (function(superClass) {
  extend(Mouse, superClass);
 /**
  * class Mouse: Relays all information on the mouse
  *    1. provides the engine with the cartesian coordinates of the input (in this case the mouse)
  *    2. notifies the engine of an input interaction (e.g:click of a mouse)
  * @param {Selector} selector1        the selector corresponding to the canvas
  * @param {String} type             the type of selector (currently can only be JQuery)
  * @param {Selector} forbiddenElement a selector containing an element that is ignored when clicked
  * @constructor
  */
  function Mouse(selector1, type, forbiddenElement) {
    this.selector = selector1;
    this.forbiddenElement = forbiddenElement;
    this.mouseChecker = bind(this.mouseChecker, this);
    this.emitMouseMove = bind(this.emitMouseMove, this);
    this.emitMouseUp = bind(this.emitMouseUp, this);
    this.emitMouseDown = bind(this.emitMouseDown, this);
    if (!this.selector) {
      throw new Error("selector undefined");
    }
    if (type !== "Jquery" && type !== "jquery") {
      throw new Error("undefined type");
    }
    this.inputType = "mouse";
  }

  Mouse.prototype.activate = function(engine1) {
    this.engine = engine1;
    if (!this.engine) {
      throw new Error("engine not defined");
    }
    if (this.engine.input) {
      throw new Error("input already exists");
    }
    this.engine.setupInput(this.inputType, this.getMouseCoord);
    return this.mouseClick();
  };

  Mouse.prototype.deactivate = function() {
    this.engine.resetInput();
    return this.mouseReset();
  };

  Mouse.prototype.emitMouseDown = function(event) {
    return this.engine.emit("mousedown", {
      cursor: new Vector(this.engine.pageX, this.engine.pageY),
      engine: this.engine
    });
  };

  Mouse.prototype.emitMouseUp = function(event) {
    return this.engine.emit("mouseup", {
      cursor: new Vector(this.engine.pageX, this.engine.pageY),
      engine: this.engine
    });
  };

  Mouse.prototype.emitMouseMove = function(event) {
    this.engine.pageX = event.pageX - 10;
    return this.engine.pageY = this.selector.height() - event.pageY + 6;
  };

  Mouse.prototype.mouseClick = function() {
    this.selector.on("mousemove.mouseInput",
      this.mouseChecker.bind(null, this.emitMouseMove));
    this.selector.on("mousedown.mouseInput",
      this.mouseChecker.bind(null, this.emitMouseDown));
    return this.selector.on("mouseup.mouseInput",
      this.mouseChecker.bind(null, this.emitMouseUp));
  };

  Mouse.prototype.mouseReset = function() {
    this.selector.off("mousemove.mouseInput");
    this.selector.off("mousedown.mouseInput");
    return this.selector.off("mouseup.mouseInput");
  };

  Mouse.prototype.mouseChecker = function(fn, e) {
    if (this.forbiddenElement) {
      if ($.contains(this.forbiddenElement[0], e.target)) {
        return;
      }
    }
    return fn(e);
  };

  return Mouse;
})(Behaviour);

CanvasControl = (function(superClass) {
  extend(CanvasControl, superClass);
  /**
   * class CanvasControl: resizes the canvas once the window is resized
   * @param {Selector} selector1 the selector for the canvas
   * @param {object} context   the context of the canvas
   * @param {object} window1   reference to the window
   * @param {String} type      the type of selector (currently can only be JQuery)
   * @constructor
   */
  function CanvasControl(selector1, context, window1, type) {
    this.selector = selector1;
    this.context = context;
    this.window = window1;
    this.adjustment = bind(this.adjustment, this);
    if (!this.selector) {
      throw new Error("selector undefined");
    }
    if (!this.context) {
      throw new Error("context undefined");
    }
    if (!this.window) {
      throw new Error("window undefined");
    }
    if (type !== "Jquery" && type !== "jquery") {
      throw new Error("undefined type");
    }
    this.adjustment();
  }

  CanvasControl.prototype.activate = function(engine1) {
    this.engine = engine1;
    if (!this.engine) {
      throw new Error("engine not defined");
    }
    return this.adjusting();
  };

  CanvasControl.prototype.deactivate = function() {
    return this.resetting();
  };

  CanvasControl.prototype.adjustment = function(event) {
    var center;
    this.selector.attr("width", this.window.width() - 24);
    this.selector.attr("height", this.window.height() - 20);
    center = new CanvasCenter();
    this.context.translate(center.x, center.y);
    this.context.scale(1, -1);
    return this.context.translate(-center.x, -center.y);
  };

  CanvasControl.prototype.adjusting = function() {
    return this.window.on("resize.behaviour", this.adjustment);
  };

  CanvasControl.prototype.resetting = function() {
    return this.window.off("resize.behaviour", this.adjustment);
  };

  return CanvasControl;
})(Behaviour);

PlayPause = (function(superClass) {
  extend(PlayPause, superClass);
  /**
   * class PlayPause: adds the play / pause functionality to the engine
   * @constructor
   */
  function PlayPause() {
    this.resets = {
      pause: [this.reset, this]
    };
  }

  PlayPause.prototype.activate = function(engine) {
    PlayPause.__super__.activate.call(this, engine, "play", "apply");
    return this.updates = {
      update: [engine.animate, engine]
    };
  };

  PlayPause.prototype.deactivate = function() {
    return PlayPause.__super__.deactivate.apply(this, arguments);
  };

  PlayPause.prototype.apply = function(event, info) {
    return PlayPause.__super__.apply.apply(this, arguments);
  };

  PlayPause.prototype.reset = function(event, info) {
    return PlayPause.__super__.reset.apply(this, arguments);
  };

  return PlayPause;
})(Behaviour);

Refresh = (function(superClass) {
  extend(Refresh, superClass);
  /**
   * class Refresh: resets the simulation to its original state
   * @constructor
   */
  function Refresh() {}

  Refresh.prototype.activate = function(engine) {
    return Refresh.__super__.activate.call(this, engine, "refresh", "update");
  };

  Refresh.prototype.deactivate = function() {
    return Refresh.__super__.deactivate.apply(this, arguments);
  };

  Refresh.prototype.update = function(event, info) {
    var engine;
    engine = info.engine;
    if (!this.isSet) {
      throw new Error("not set");
    }
    engine.emit("pause", {
      cursor: new Vector(engine.pageX, engine.pageY),
      engine: engine
    });
    return engine.shapes = [];
  };

  return Refresh;
})(Behaviour);

Cord = (function(superClass) {
  extend(Cord, superClass);
  /**
   * class String: binds and pulls all shapes together with a string that pulls them all together
   * @constructor
   */
  function Cord() {
    this.strings = new Queue();
    this.updates = {
      animate: [this.update, this],
      implement: [this.singleCord, this]
    };
    this.resets = {
      destringify: [this.reset, this],
      refresh: [this.reset, this]
    };
  }

  Cord.prototype.set = function(obj) {
    if (obj == null) {
      obj = {
        all: true,
        massOnly: false,
        maxLength: 100
      };
    }
    this.massOnly = obj.massOnly == null ? false : obj.massOnly;
    this.maxLength = obj.maxLength == null ? 100 : obj.maxLength;
    return this.isSet = true;
  };

  Cord.prototype.activate = function(engine) {
    return Cord.__super__.activate.call(this, engine, "stringify", "apply");
  };

  Cord.prototype.deactivate = function() {
    return Cord.__super__.deactivate.apply(this, arguments);
  };

  Cord.prototype.apply = function(event, info) {
    var engine;
    Cord.__super__.apply.apply(this, arguments);
    engine = info.engine;
    return this.createCords(engine);
  };

  Cord.prototype.reset = function(event, info) {
    var engine;
    engine = info.engine;
    this.strings.clear();
    Cord.__super__.reset.apply(this, arguments);
  };

  Cord.prototype.createCords = function(engine) {
    var i, i1, j, len1, results, shapes;
    shapes = engine.shapes;
    results = [];
    for (i1 = j = 0, len1 = shapes.length; j < len1; i1 = ++j) {
      i = shapes[i1];
      results.push(this.singleCord(null, {
        shape: i,
        index: i1,
        shapes: shapes
      }));
    }
    return results;
  };

  Cord.prototype.singleCord = function(event, info) {
    var index, j, len1, n, n1, results, shape, shapes;
    shape = info.shape;
    index = info.index;
    shapes = info.shapes;
    results = [];
    for (n1 = j = 0, len1 = shapes.length; j < len1; n1 = ++j) {
      n = shapes[n1];
      if (n1 >= index) {
        continue;
      }
      if (!(n.get("invM") || shape.get("invM"))) {
        continue;
      }
      if (this.massOnly) {
        if (!(n.get("invM") && shape.get("invM"))) {
          continue;
        }
      }
      results.push(this.strings.queue([shape, n]));
    }
    return results;
  };

  Cord.prototype.moveCord = function(arr) {
    var A, B, color, contactVel, impulse, invMassA, invMassB, invMassSum,
      moveVec, n, rv, string;
    A = arr[0];
    B = arr[1];
    invMassA = A.get("invM");
    invMassB = B.get("invM");
    string = new Line(A.get("position"), B.get("position"));
    moveVec = string.vector();
    moveVec.getLength();
    color = moveVec.length < 200 ? "grey" : "red";
    n = moveVec.unit();
    rv = B.get("v").subtract(A.get("v"));
    contactVel = rv.dot(n);
    contactVel = contactVel <= 0 ? 0 : contactVel;
    invMassSum = invMassA + invMassB;
    impulse = contactVel * (-1) / invMassSum * 0.01;
    impulse = -abs(1 / invMassSum * 0.001);
    if (invMassA) {
      B.applyForce(n.scale(impulse));
    }
    if (invMassB) {
      A.applyForce(n.scale(-impulse));
    }
    return string.draw(0.4, color);
  };

  Cord.prototype.update = function(event, info) {
    var engine, i, j, len1, ref1, results, shapes;
    engine = info.engine;
    shapes = engine.shapes;
    if (!shapes) {
      throw new Error("Error: no 'shapes' array present");
    }
    ref1 = this.strings.storage;
    results = [];
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      results.push(this.moveCord(i));
    }
    return results;
  };

  return Cord;
})(Behaviour);

Gravity = (function(superClass) {
  extend(Gravity, superClass);
  /**
   * class Gravity: applies a constant force upon all weighted shapes to a specific direction
   * @constructor
   */
  function Gravity() {
    this.a = new Vector();
    this.updates = {
      animate: [this.update, this]
    };
    this.resets = {
      degravitate: [this.reset, this],
      refresh: [this.reset, this]
    };
  }

  Gravity.prototype.set = function(mag, dir) {
    var incorrectDir;
    incorrectDir = "Error: Missing or Incorrect assignment of direction " +
    "vector.\n Make sure the input direction vector is a unit vector and has" +
    " a length property (of 1)";
    if (!dir) {
      throw new Error(incorrectDir);
    }
    if (!dir.length) {
      dir.getLength();
    }
    if (!(abs(dir.length - 1) < 0.1)) {
      throw new Error(incorrectDir);
    }
    this.a = dir.scale(mag);
    return this.isSet = true;
  };

  Gravity.prototype.activate = function(engine) {
    return Gravity.__super__.activate.call(this, engine, "gravitate", "apply");
  };

  Gravity.prototype.deactivate = function() {
    return Gravity.__super__.deactivate.apply(this, arguments);
  };

  Gravity.prototype.apply = function(event, info) {
    return Gravity.__super__.apply.apply(this, arguments);
  };

  Gravity.prototype.reset = function(event, info) {
    return Gravity.__super__.reset.apply(this, arguments);
  };

  Gravity.prototype.update = function(event, info) {
    var engine, j, len1, results, shape, shapes;
    engine = info.engine;
    shapes = engine.shapes;
    if (!shapes) {
      throw new Error("Error: no 'shapes' array present");
    }
    results = [];
    for (j = 0, len1 = shapes.length; j < len1; j++) {
      shape = shapes[j];
      if (shape.get("invM")) {
        results.push(shape.applyForce(this.a.scale(1 / shape.get("invM"))));
      } else {
        results.push(undefined);
      }
    }
    return results;
  };

  return Gravity;
})(Behaviour);

Drag = (function(superClass) {
  extend(Drag, superClass);
  /**
   * class class Drag: allows the user to apply a force on any shape in any direction by clicking and dragging.
   * @constructor
   */
  function Drag() {
    this.velocity = new Vector();
    this.updates = {
      animate: [this.update, this]
    };
    this.resets = {
      mouseup: [this.reset, this],
      refresh: [this.reset, this]
    };
  }

  Drag.prototype.activate = function(engine) {
    return Drag.__super__.activate.call(this, engine, "mousedown", "apply");
  };

  Drag.prototype.deactivate = function() {
    return Drag.__super__.deactivate.apply(this, arguments);
  };

  Drag.prototype.apply = function(event, info) {
    var engine;
    engine = info.engine;
    if (!this.isSet) {
      throw new Error("not set");
    }
    this.mouseLoc = info.cursor;
    this.shape = this.findShape(engine);
    if (!this.shape) {
      return;
    }
    this.refLoc = this.addPoint(this.mouseLoc.copy(), this.shape);
    return Drag.__super__.apply.apply(this, arguments);
  };

  Drag.prototype.reset = function(event, info) {
    if (this.shape) {
      this.deletePoint(this.refLoc, this.shape);
    }
    this.refLoc = null;
    this.shape = null;
    this.mouseLoc = null;
    return Drag.__super__.reset.apply(this, arguments);
  };

  Drag.prototype.set = function(speed, pull1, torqueDamp) {
    this.speed = speed == null ? 0.01 : speed;
    this.pull = pull1 == null ? 0.71 : pull1;
    this.torqueDamp = torqueDamp == null ? 800 : torqueDamp;
    return this.isSet = true;
  };

  Drag.prototype.firstClicked = function(event, info) {
    var engine;
    engine = info.engine;
    this.mouseLoc = info.cursor;
    this.shape = this.findShape(engine);
    if (!this.shape) {
      return;
    }
    this.refLoc = this.addPoint(this.mouseLoc.copy(), this.shape);
    this.clicking = engine.on("animate", this.update, this);
    return engine.on("mouseup", this.reset, this);
  };

  Drag.prototype.update = function(event, info) {
    var engine;
    if (!this.isSet) {
      throw new Error("not set");
    }
    this.mouseLoc = info.cursor;
    engine = info.engine;
    if (!this.shape) {
      return this.reset(null, info);
    }
    this.velocity = this.mouseLoc.subtract(this.refLoc);
    return this.ropePull(this.shape, this.velocity, this.refLoc);
  };

  Drag.prototype.addPoint = function(point, shape) {
    var check, points;
    check = this.findPoint(point, shape);
    if (check) {
      return check;
    }
    points = shape.shapes[0].get("points");
    point.index = points.length;
    point.id = makeid();
    points.push(point);
    return point;
  };

  Drag.prototype.findPoint = function(point, shape) {
    var i, j, len1, ref1;
    ref1 = shape.shapes[0].get("points");
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      if (i.id === point.id) {
        return i;
      }
    }
    return false;
  };

  Drag.prototype.deletePoint = function(point, shape) {
    var foundPoint, index;
    if (!this.refLoc) {
      return;
    }
    if (!(foundPoint = this.findPoint(point, shape))) {
      throw new Error("Error: cannot find Point");
    }
    index = foundPoint.index;
    return shape.shapes[0].get("points").splice(index, 1);
  };

  Drag.prototype.findShape = function(engine) {
    var j, len1, shape, shapes;
    shapes = engine.shapes;
    if (!shapes) {
      throw new Error("Error: no 'shapes' array present");
    }
    for (j = 0, len1 = shapes.length; j < len1; j++) {
      shape = shapes[j];
      if (shape.inside(this.mouseLoc)) {
        return shape;
      }
    }
    return false;
  };

  Drag.prototype.ropePull = function(shape, force, contact, friction, pull,
     length, color, width, secondaryColor) {
    var color_, difference, dot, fProj, fnorm, funit, vProj, vel, weight;
    if (friction == null) {
      friction = 0.03;
    }
    if (length == null) {
      length = 100;
    }
    if (color == null) {
      color = "lightgrey";
    }
    if (width == null) {
      width = 1.5;
    }
    if (secondaryColor == null) {
      secondaryColor = "red";
    }
    if (!force) {
      throw new Error("Error: missing force. Please define a force as a" +
       " parameter for the function to operate");
    }
    color_ = color;
    if (!force.length) {
      force.getLength();
    }
    funit = force.unit();
    fnorm = funit.normal();
    vel = shape.get("v");
    dot = funit.dot(vel);
    if (dot < 0 && force.length > length) {
      difference = force.length - length;
      vProj = vel.projection(funit);
      fProj = vel.projection(fnorm).scale(-1);
      shape.applyForce(vProj.scale(-1), contact);
      shape.move(funit.scale(difference * 0.01 * shape.get("invM")));
      shape.applyForce(fProj.scale(friction), contact);
    }
    if (force.length > length * 1.5) {
      color_ = secondaryColor;
      weight = shape.get("invM") / 10000;
      shape.applyForce(force.scale(weight), contact);
    }
    if (contact) {
      return new Line(contact, contact.add(force)).draw(width, color_);
    }
  };

  return Drag;
})(Behaviour);

AddShape = (function(superClass) {
  extend(AddShape, superClass);
  /**
   * class AddShape: allows the user to specify which shape gets added to the simulation using a set of predetermined presets.
   * @param {Object} engine reference to the engine instance
   * @constructor
   */
  function AddShape(engine) {
    this.count = 0;
    this.mouseLoc = new Vector();
    this.locs = [];
    this.callBack = null;
  }

  AddShape.prototype.activate = function(engine) {
    return AddShape.__super__.activate.call(this, engine, "mousedown",
     "update");
  };

  AddShape.prototype.deactivate = function() {
    return AddShape.__super__.deactivate.apply(this, arguments);
  };

  /*
  apply:(event,info)->
      return @update.apply @,arguments
   */

  AddShape.prototype.setVelocity = function(initialLoc, finalLoc, shape) {
    shape.v = finalLoc.subtract(initialLoc).scale(0.003);
    return shape;
  };

  AddShape.prototype.setLocation = function(loc, shape) {
    shape.x = loc.x;
    shape.y = loc.y;
    return shape;
  };

  AddShape.prototype.firstOperation = function(locations, cursor) {
    locations.push(new Vector(cursor.x, cursor.y));
    if (locations.length !== 2) {
      return false;
    }
    if (this.shape.setLoc) {
      this.setLocation(locations[0], this.shape);
    }
    if (this.shape.setVel) {
      this.setVelocity(locations[0], locations[1], this.shape);
    }
    return this.shape;
  };

  AddShape.prototype.update = function(event, info) {
    var engine;
    if (!this.isSet) {
      return;
    }
    engine = info.engine;
    this.mouseLoc = info.cursor;
    if (this.findShape(engine)) {
      return;
    }
    this.count = engine.shapes.length;
    if (!this.shape1) {
      throw new Error("Error: Shapes are not defined");
    }
    this.setShape(engine);
    if (!this.firstOperation(this.locs, this.mouseLoc)) {
      return;
    }
    this.locs = [];
    this.createdShape = this.createShape(this.shape);
    engine.implement(this.createdShape);
    if (this.callBack) {
      return this.callBack(engine);
    }
  };

  AddShape.prototype.set = function(shape11, shape21, mode) {
    var typesOfModes;
    // this.shape1 = shape11 != null ? shape11 : null;
    this.shape1 = shape11 == null ? null : shape11;
    // this.shape2 = shape21 != null ? shape21 : null;
    this.shape2 = shape21 == null ? null : shape21;
    typesOfModes = ["container", "random", "target", "compound"];
    if (typesOfModes.indexOf(mode) < 0) {
      throw new Error("Error: spawnMode unidentified");
    }
    this.setShape = eval("this." + mode);
    return this.isSet = true;
  };

  AddShape.prototype.createShape = function(props) {
    var construct;
    construct = props.type;
    if (!construct || typeof construct !== "string" || !eval(construct)) {
      throw new Error("Error: invalid or missing type");
    }
    return new (eval(construct))(props);
  };

  AddShape.prototype.container = function(engine) {
    if (this.count !== 0) {
      return this.shape = this.shape1;
    }
    engine.implement(this.createShape({
      type: "Rectangle",
      x: jcan.width() / 2,
      y: 35,
      width: 700,
      height: 70,
      invM: 0,
      sf: 0.5,
      df: 0.4,
      restitution: 0.0
    }));
    engine.implement(this.createShape({
      type: "Rectangle",
      x: jcan.width() - 20,
      y: 70 + 400 / 2,
      width: 20,
      height: 400,
      invM: 0,
      sf: 0.3,
      df: 0.2,
      restitution: 0.0
    }));
    engine.implement(this.createShape({
      type: "Rectangle",
      x: 20,
      y: 70 + 400 / 2,
      width: 20,
      height: 400,
      invM: 0,
      sf: 0.3,
      df: 0.2,
      restitution: 0.0
    }));
    return this.shape = this.shape1;
  };

  AddShape.prototype.random = function() {
    var array_, length;
    console.log(this.shape1);
    length = this.shape1.constructor === Array ? this.shape1.length : 1;
    array_ = this.shape1.constructor === Array ?
     this.shape1 : [this.shape1, this.shape2];
    return this.shape = array_[getRandomInt(0, length)];
  };

  AddShape.prototype.target = function() {
    return this.shape = (function() {
      switch (this.count) {
      case 1:
        return this.shape1;
      default:
        return this.shape2;
      }
    }).call(this);
  };

  AddShape.prototype.compound = function(engine) {
    var array_, length;
    if (!this.callBack) {
      this.callBack = this.CompoundCallback;
    }
    length = typeof this.shape1.constructor === Array ? this.shape1.length : 1;
    array_ = typeof this.shape1.constructor === Array ?
      this.shape1 : [this.shape1, this.shape2];
    return this.shape = array_[getRandomInt(0, length)];
  };

  AddShape.prototype.CompoundCallback = function(engine) {
    var i, j, len1, ref1;
    if (!this.initialComp) {
      this.initialComp = this.createdShape;
      return engine.one("refresh", (function() {
        return this.initialComp = null;
      }), this);
    }
    ref1 = this.createdShape.shapes;
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      this.initialComp.addShape(i);
    }

    /*
    test4 = new Rectangle {
                           invM:1/1.5
                           orient:0
                           sf: 0.8
                           df: 0.5
                           restitution: 0
                           v:new Vector(-0.1,-0.1)
                           x:300
                           y:200
                           width:50
                           height: 89
                           }
     */
    return engine.shapes.pop();
  };

  AddShape.prototype.findShape = function(engine) {
    var j, len1, shape, shapes;
    shapes = engine.shapes;
    if (!shapes) {
      throw new Error("Error: no 'shapes' array present");
    }
    for (j = 0, len1 = shapes.length; j < len1; j++) {
      shape = shapes[j];
      if (shape.inside(this.mouseLoc)) {
        return shape;
      }
    }
    return false;
  };

  AddShape.prototype.setVelFn = function(shape) {
    if (!this.initCount) {
      this.initLoc = new Vector(shape.x, shape.y);
      this.initCount = true;
      return false;
    }
    this.initCount = null;
    this.initVel = null;
    return shape.v = new Vector(shape.x, shape.y).subtract(this.initLoc)
    .scale(0.003);
  };

  return AddShape;
})(Behaviour);

Presets = (function() {
  /**
   * class Presets: is a set of different instances of behaviours that can be activated or deactivated.
   * @constructor
   */
  function Presets() {
    this.storage = [];
    this.pickedIndex = -1;
    this.isSet = false;
  }

  Presets.prototype.activate = function(engine) {
    if (!this.isSet) {
      return;
    }
    this.engine = this.engine || engine;
    return this.storage[this.pickedIndex].activate(this.engine);
  };

  Presets.prototype.deactivate = function() {
    if (!this.isSet) {
      return;
    }
    return this.storage[this.pickedIndex].deactivate();
  };

  Presets.prototype.add = function(choice, Construct) {
    var addFn;
    this.pickedIndex = this.pickedIndex < 0 ? 0 : this.pickedIndex;
    this.isSet = this.isSet || true;
    addFn = this.storage[this.storage.push(new Construct()) - 1];
    return addFn.set.apply(addFn, choice);
  };

  Presets.prototype.choose = function(index) {
    if (index < 0 || index > this.storage.length - 1) {
      throw new Error("invalid index");
    }
    this.deactivate();
    this.pickedIndex = index;
    return this.activate(this.engine);
  };

  return Presets;
})();

Vector = (function() {
  /**
   * class Vector: a class providing a mathematical vector object
   * @param {number} x a number represting the x coordinate
   * @param {number} y a number represting the y coordinate
   * @constructor
   */
  function Vector(x, y) {
    this.x = x == null ? 0 : x;
    this.y = y == null ? 0 : y;
  }

  Vector.prototype.copy = function(temp, temp2) {
    var k;
    k = new Vector(this.x, this.y);
    k.length = this.length;
    return k;
  };

  Vector.prototype.move = function(other) {
    this.x += other.x;
    this.y += other.y;
    this.length = this.a = undefined;
  };

  Vector.prototype.equal = function(other) {
    this.x = other.x;
    this.y = other.y;
    this.length = other.length;
    this.a = other.a;
  };

  Vector.prototype.scale = function(s, temp) {
    var k;
    if (abs(s === Infinity)) {
      throw new Error("infinity alert!");
    }
    k = new Vector(this.x * s, this.y * s);
    k.length = this.length * abs(s);
    return k;
  };

  Vector.prototype.subtract = function(other) {
    return new Vector(this.x - other.x, this.y - other.y);
  };

  Vector.prototype.add = function(other) {
    return new Vector(this.x + other.x, this.y + other.y);
  };

  Vector.prototype.scaleAdd = function(s) {
    return new Vector(this.x + s, this.y + s);
  };

  Vector.prototype.getLength = function() {
    return this.length = sqrt(sqr(this.x) + sqr(this.y));
  };

  Vector.prototype.getAngle = function() {
    return this.a = atan2(this.y, this.x);
  };

  Vector.prototype.angle = function(other) {
    var k;
    k = this.a - other.a;
    if (k < 0) {
      return 2 * pi + k;
    }
    if (k > 2 * pi) {
      return k - 2 * pi;
    }
    return k;
  };

  Vector.prototype.dot = function(other) {
    return this.x * other.x + this.y * other.y;
  };

  Vector.prototype.cross = function(other) {
    return this.dot(other.normal().scale(-1));
  };

  Vector.prototype.scaleCross = function(s) {
    return this.normal().scale(-s);
  };

  Vector.prototype.unit = function() {
    var k;
    if (!(this.x || this.y)) {
      k = new Vector();
      k.length = 0;
      return k;
    }
    k = new Vector(this.x / this.length, this.y / this.length);
    k.length = 1;
    return k;
  };

  Vector.prototype.projection = function(other) {
    var temp, temp2;
    temp2 = other.unit();
    temp = this.dot(temp2);
    temp2 = temp2.scale(temp);
    return temp2;
  };

  Vector.prototype.line = function() {
    return new Line(new Vector(), this.copy());
  };

  Vector.prototype.normal = function() {
    var k;
    k = new Vector(-this.y, this.x);
    k.length = this.length;
    k.a += pi / 2;
    return k;
  };

  Vector.prototype.farther = function(a, otherPoint) {
    if (otherPoint[a] > this[a]) {
      return true;
    }
    return false;
  };

  Vector.prototype.farthest = function(a, otherPoint) {
    if (this.farther(a, otherPoint)) {
      return otherPoint;
    }
    return this;
  };

  Vector.prototype.nearest = function(a, otherPoint) {
    if (!this.farther(a, otherPoint)) {
      return otherPoint;
    }
    return this;
  };

  Vector.prototype.rotate = function(axis, angle) {
    var cosA, cx, cy, k, sinA;
    if (axis.constructor.name !== "Vector") {
      throw new Error(axis);
    }
    if (typeof angle !== "number") {
      throw new Error(angle);
    }
    cosA = cos(angle);
    sinA = sin(angle);
    cx = ((this.x - axis.x) * cosA) - ((this.y - axis.y) * sinA) + axis.x;
    cy = ((this.x - axis.x) * sinA) + ((this.y - axis.y) * cosA) + axis.y;
    k = new Vector(cx, cy);
    k.length = this.length;
    k.a = this.a + angle;
    return k;
  };

  Vector.prototype.draw2 = function(bool, bool2, bool3) {
    var temp, start, end;
    start = bool == null ? new CanvasCenter() : {
      x: 0,
      y: 0
    };
    end = {
      x: this.x + start.x,
      y: this.y + start.y
    };
    temp = {
      type: "arc",
      fillStyle: "black",
      radius: 3,
      x: end.x,
      y: end.y
    };
    jcan.draw(temp);
    if (bool2 == null) {
      return;
    }
    temp = {
      type: "line",
      strokeWidth: bool2 || 0.5,
      strokeStyle: bool3 == null ? "black" : bool3,
      x1: start.x,
      y1: start.y,
      x2: end.x,
      y2: end.y
    };
    return jcan.draw(temp);
  };

  Vector.prototype.draw = function(bool, bool2, bool3) {
    var end, start;
    start = bool == null ? new CanvasCenter() : {
      x: 0,
      y: 0
    };
    end = {
      x: this.x,
      y: this.y
    };
    end.x += start.x;
    end.y += start.y;
    ctxx.beginPath();
    ctxx.fillStyle = "black";
    ctxx.arc(end.x, end.y, 3, 0, 2 * pi);
    ctxx.fill();
    if (bool2 == null) {
      return;
    }
    ctxx.beginPath();
    ctxx.strokeStyle = bool3 == null ? "black" : bool3;
    ctxx.lineWidth = bool2 || 0.5;
    ctxx.moveTo(start.x, start.y);
    ctxx.lineTo(end.x, end.y);
    return ctxx.stroke();
  };

  Vector.prototype.centroid = function(points) {
    var area, end, i, j, len, len1, result, temp;
    area = this.sArea(points);
    if (!area) {
      return this.centroidStraight(points);
    }
    len = points.length;
    if (len === 1) {
      return points[0].copy();
    }
    if (len === 2) {
      return new Vector((points[0].x + points[1].x) / 2,
       (points[0].y + points[1].y) / 2);
    }
    end = points[len - 1];
    result = new Vector();
    for (j = 0, len1 = points.length; j < len1; j++) {
      i = points[j];
      temp = end.cross(i);
      result.move(end.add(i).scale(temp));
      end = i;
    }
    temp = 1 / ((6 * this.sArea(points)) || 1);
    return result.scale(temp);
  };

  Vector.prototype.centroidStraight = function(points) {
    var i, j, len, len1, result;
    len = points.length;
    result = new Vector();
    for (j = 0, len1 = points.length; j < len1; j++) {
      i = points[j];
      result.x += i.x;
      result.y += i.y;
    }
    result.x /= len;
    result.y /= len;
    return result;
  };

  Vector.prototype.sArea = function(points) {
    var end, i, j, len1, ret;
    ret = 0;
    end = points[points.length - 1];
    for (j = 0, len1 = points.length; j < len1; j++) {
      i = points[j];
      ret += end.cross(i);
      end = i;
    }
    return ret / 2;
  };

  Vector.prototype.invMOI = function(invMass, points) {
    var end, i, i1, j, len, len1, ret, tmp, total, vec;
    len = points.length;
    if (len === 1) {
      return 0;
    }
    if (len === 2) {
      vec = points[1].subtract(points[0]);
      return vec.dot(vec) / 12;
    }
    ret = 0;
    total = 0;
    end = points[0];
    for (i1 = j = 0, len1 = points.length; j < len1; i1 = ++j) {
      i = points[i1];
      if (i1 === 0) {
        continue;
      }
      tmp = abs(i.cross(end));
      ret += tmp * (i.dot(i) + i.dot(end) + end.dot(end));
      total += tmp;
      end = i;
    }
    if (ret) {
      return (6 * total * invMass) / ret;
    }
    return 0;
  };

  return Vector;
})();

Line = (function() {
  /**
   * class Line: a line joining two vector instances
   * @param {Vector} p11 the first vector of the line
   * @param {Vector} p21 the second vector of the line
   * @constructor
   */
  function Line(p11, p21) {
    this.p1 = p11;
    this.p2 = p21;
  }

  Line.prototype.copy = function(temp, temp2) {
    return new Line(this.p1.copy(), this.p2.copy());
  };

  Line.prototype.move = function(other) {
    this.p1.move(other);
    return this.p2.move(other);
  };

  Line.prototype.getLength = function() {
    var k;
    k = this.vector();
    return this.length = k.getLength();
  };

  Line.prototype.add = function(other) {
    return new Line(this.p1.add(other), this.p2.add(other));
  };

  Line.prototype.middle = function() {
    return new Vector((this.p1.x + this.p2.x) / 2, (this.p1.y + this.p2.y) / 2);
  };

  Line.prototype.normal = function() {
    var k, mid;
    k = this.vector();
    k = k.normal();
    mid = this.middle();
    k = k.line().add(mid);
    k.length = this.length;
    return k;
  };

  Line.prototype.vector = function() {
    var k;
    k = this.p2.subtract(this.p1);
    k.length = this.length;
    return k;
  };

  Line.prototype.dot = function(other) {
    var vector1, vector2;
    vector1 = this.vector();
    vector2 = other.vector();
    return vector1.dot(vector2);
  };

  Line.prototype.rotate = function(axis, angle) {
    this.p1 = this.p1.rotate(axis, angle);
    return this.p2 = this.p2.rotate(axis, angle);
  };

  Line.prototype.closest = function(point) {
    var b, k, normal;
    k = new Line(point, this.p1);
    normal = this.normal().vector();
    normal.getLength();
    b = k.vector().projection(normal);
    return b.add(point);
  };

  Line.prototype.intersects = function(other) {
    var c, d, deltaInitial, initial, k, otherInitial, ref1, ref2;
    initial = this.vector();
    otherInitial = other.vector();
    k = otherInitial.cross(initial);
    deltaInitial = this.p1.subtract(other.p1);
    c = deltaInitial.cross(initial) / k;
    d = deltaInitial.cross(otherInitial) / k;
    // if both c and d are between 0 and 1
    if (((c > 0) && c <= 1) && ((d > 0) && (d <= 1))) {
      return this.p1.subtract(initial.scale(-d));
    }
    return false;
  };

  Line.prototype.draw2 = function(width, style) {
    var temp;
    temp = {
      type: "line",
      strokeWidth: width == null ? 3 : width,
      strokeStyle: style || "black",
      x1: this.p1.x,
      y1: this.p1.y,
      x2: this.p2.x,
      y2: this.p2.y
    };
    return jcan.draw(temp);
  };

  Line.prototype.draw = function(width, style) {
    ctxx.beginPath();
    ctxx.strokeStyle = style || "black";
    ctxx.lineWidth = width == null ? 3 : width;
    ctxx.moveTo(this.p1.x, this.p1.y);
    ctxx.lineTo(this.p2.x, this.p2.y);
    return ctxx.stroke();
  };

  return Line;
})();

Body = (function() {
  /**
   * class Body: any body element that has a set existance in the engine. It could be moved, has a weight and could be drawn.
   * @param {object} input an object containing all the relevant information for the creation of the body (e.g: weight).
   * @constructor
   */
  function Body(input) {
    /**
     *   Format of input for body:
     *   shapes: [a,b,c,d,...] - the shapes included in the body
     *           @property setLoc: true - setting the location of the shape using an input
     *           @property setVel: true - setting the velocity using input
     *           @property invM:1/1.5, - setting the mass by setting its inverse, the mass of this object is 1.5 units
     *           @property invI:1/1.5, - setting the moment of inertia by setting its inverse, it will be the same as mass if one isnt chosen
     *           @property orient:0, - the initial orientation of the shape
     *           @property sf: 0.8, - the coefficient of static friction of the object
     *           @property df: 0.5, - the coefficient of dynamic friction of the object
     *           @property restitution: 0 - the coefficient of restitution of the object
     *           @property v:new Vector(-1,-0.5) - the intitial velocity, if not set
     *           @property x:400, - setting the location, if it isnt set, it will be
     *           @property y:200, - set automatically from the centers of its shapes
     */
    var i, i1;
    this.physical = {
      domains: []
    };
    this.components = [this.physical];
    if (!input) {
      return;
    }
    this.shapes = input.shapes || [];
    for (i1 = 0; i1 < this.shapes.length; i1++) {
      i = this.shapes[i1];
      if (i1 >= 1) {
        throw new Error("if you want more shapes," +
        " add them using the addShape function!");
      }
      this.shapes[i1] = new Shape(i);
      this.shapes[i1].body = this;
    }
    this.setPhysical(input);
    this.integrator = this.DefaultIntegrator;
  }

  Body.prototype.setPhysical = function(input) {
    this.physical.domains = this.physical.domains.concat(["v", "rv", "force",
     "torque", "sf", "df", "invM", "invI", "position",
      "bounding", "restitution"]);
    this.physical.force = new Vector();
    this.physical.torque = 0;
    this.physical.rv = 0;
    if (!input) {
      return;
    }
    this.physical.v = input.v ? input.v.copy() : new Vector();
    this.physical.sf = input.sf || 0;
    this.physical.df = input.df || 0;
    this.physical.restitution = input.restitution || 0;
    this.physical.invM = input.invM || 0;
    this.physical.invI = input.invI || this.physical.invM / 100;
    this.physical.position = (input.x != null) && (input.y != null) ?
     new Vector(input.x, input.y) : new Vector();
    this.determineCenter();
    this.physical.bounding = [new Vector(), new Vector()];
    this.generateBounds();
    return this.determineinvMOI();
  };

  Body.prototype.addShape = function(shape) {
    var Iadd, Itot, pieceMass, vec;
    shape.body = this;
    this.shapes.push(shape);
    this.determineCenter();
    this.generateBounds();
    if (!this.physical.invM) {
      return;
    }
    pieceMass = (1 / this.physical.invM) / (this.shapes.length - 1);
    vec = this.physical.position.subtract(shape.physical.position);
    Iadd = vec.dot(vec);
    Itot = 1 / (shape.determineinvMOI()) + Iadd;
    Itot *= pieceMass;
    this.physical.invI = 1 / ((1 / this.physical.invI) + Itot);
    return this.physical.invM = 1 / (pieceMass * this.shapes.length);
  };

  Body.prototype.determineCenter = function() {
    var area, i, initCent, j, len1, positions, ref1, totArea;
    positions = [];
    totArea = 0;
    initCent = new Vector();
    ref1 = this.shapes;
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      if (!i.physical.area) {
        i.calcArea();
      }
      area = i.physical.area;
      totArea += area;
      initCent.move(i.physical.position.scale(area));
    }
    if (totArea) {
      return this.physical.position = initCent.scale(1 / totArea);
    }
  };

  Body.prototype.determineinvMOI = function() {
    var i, j, len1, ref1, totI;
    totI = 0;
    ref1 = this.shapes;
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      totI += 1 / i.determineinvMOI();
    }
    return this.physical.invI = this.physical.invM / totI;
  };

  Body.prototype.get = function(item) {
    var component, domain, j, len1, len2, p, ref1, ref2;
    ref1 = this.components;
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      component = ref1[j];
      ref2 = component.domains;
      for (p = 0, len2 = ref2.length; p < len2; p++) {
        domain = ref2[p];
        if (item === domain) {
          return component[item];
        }
      }
    }
  };

  Body.prototype.set = function(item, val) {
    var component, domain, j, len1, len2, p, ref1, ref2;
    ref1 = this.components;
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      component = ref1[j];
      ref2 = component.domains;
      for (p = 0, len2 = ref2.length; p < len2; p++) {
        domain = ref2[p];
        if (item === domain) {
          component[item] = val;
          return true;
        }
      }
    }
    return false;
  };

  Body.prototype.getShape = function(index) {
    if (index >= this.shapes.length || index < 0) {
      return null;
    }
    return this.shapes[index];
  };

  Body.prototype.setShape = function(index, shape) {
    if (index >= this.shapes.length || index < 0) {
      return null;
    }
    return this.shapes[index] = shape;
  };

  Body.prototype.inside = function(point) {
    var i, j, len1, ref1;
    ref1 = this.shapes;
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      if (i.inside(point)) {
        return true;
      }
    }
    return false;
  };

  Body.prototype.generateBounds = function() {
    var i, j, len1, maxX, maxY, minX, minY, ref1, temp;
    maxX = -Infinity;
    maxY = -Infinity;
    minX = Infinity;
    minY = Infinity;
    ref1 = this.shapes;
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      i.generateBounds();
      if ((temp = i.physical.bounding[0].x) > maxX) {
        maxX = temp;
      }
      if ((temp = i.physical.bounding[0].y) > maxY) {
        maxY = temp;
      }
      if ((temp = i.physical.bounding[1].x) < minX) {
        minX = temp;
      }
      if ((temp = i.physical.bounding[1].y) < minY) {
        minY = temp;
      }
    }
    this.physical.bounding[0].x = maxX;
    this.physical.bounding[0].y = maxY;
    this.physical.bounding[1].x = minX;
    return this.physical.bounding[1].y = minY;
  };

  Body.prototype.draw = function(ctx) {
    var j, len1, ref1, results, shape;
    ref1 = this.shapes;
    results = [];
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      shape = ref1[j];
      results.push(shape.draw(ctx));
    }
    return results;
  };

  Body.prototype.integrate = function(ts) {
    return this.integrator(ts);
  };

  Body.prototype.DefaultIntegrator = function(ts) {
    var i, n, n1, p, q, r, v, w;
    this.physical.rv += this.physical.torque;
    this.physical.v.move(this.physical.force);
    this.physical.position.move(this.physical.v.scale(ts));
    for (n1 = 0; n1 < this.shapes.length; n1++) {
      n = this.shapes[n1];
      n.physical.position.move(this.physical.v.scale(ts));
      for (p = 0; p < n.physical.verticies.length; p++) {
        i = n.physical.verticies[p];
        i.move(this.physical.v.scale(ts));
      }
      for (q = 0; q < n.physical.points.length; q++) {
        i = n.physical.points[q];
        i.move(this.physical.v.scale(ts));
      }
      n.physical.position.equal(n.physical.position.rotate(
        this.physical.position, this.physical.rv * ts));
      for (r = 0; r < n.physical.verticies.length; r++) {
        i = n.physical.verticies[r];
        i.equal(i.rotate(this.physical.position, this.physical.rv * ts));
      }
      for (v = 0; v < n.physical.points.length; v++) {
        i = n.physical.points[v];
        i.equal(i.rotate(this.physical.position, this.physical.rv * ts));
      }
      for (w = 0; w < n.physical.norms.length; w++) {
        i = n.physical.norms[w];
        i.equal(i.rotate(new Vector(), this.physical.rv * ts));
      }
    }
    this.generateBounds();
    this.physical.force.x = 0;
    this.physical.force.y = 0;
    return this.physical.torque = 0;
  };

  Body.prototype.support = function(direction) {
    var i, index, j, max, maxVec, support, tempMax;
    max = -Infinity;
    maxVec = null;
    index = null;
    for (j = 0; j < this.shapes.length; j++) {
      i = this.shapes[j];
      support = i.support(direction);
      tempMax = direction.dot(support.subtract(this.physical.position));
      if (tempMax > max) {
        max = tempMax;
        maxVec = support;
      }
    }
    return maxVec;
  };

  Body.prototype.move = function(obj) {
    var i, j, results;
    if (obj != null) {
      this.physical.position.move(obj);
    }
    for (j = 0; j < this.shapes.length; j++) {
      i = this.shapes[j];
      i.move(obj);
    }
  };

  Body.prototype.applyForce = function(force, contact) {
    var conCrossF, contact_;
    this.physical.force.move(force.scale(this.physical.invM));
    if (!contact) {
      return;
    }
    contact_ = contact.subtract(this.physical.position);
    conCrossF = contact_.cross(force.scale(this.physical.invI));
    this.physical.torque += conCrossF;
    return conCrossF;
  };

  return Body;
})();

Shape = (function() {
  /**
   * class Shape: a 2 dimensional shape object class stucture
   * @param {object} input an object containing all the relevant information for the creation of the shape (e.g: fill).
   * @constructor
   */
  function Shape(input) {
    /**
     *      Format of input for Shape:
     *      @property x:400, - setting the location
     *      @property y:200, - setting the location
     *      @property points: [
     *                  [3,2]  - these are setting the verticies
     *                  [3,1]    of the shape. However, not all
     *                  [4,1]    shapes have verticies, special
     *                  [2,4]    cases do exist like circles
     *              ]
     *      @property fill: "blue" - the color of the object, if one isnt
     *                   assigned, a random color will be chosen
     *      @property stroke: [1,"grey"] - the trim of the shape, if one isnt
     *                   assigned, there wont be any
     */
    this.type = "Shape";
    this.physical = {
      domains: []
    };
    this.appearance = {
      domains: []
    };
    this.components = [this.physical, this.appearance];
    this.setPhysical(input);
    this.setAppearance(input);
  }

  Shape.prototype.setPhysical = function(input) {
    this.physical.domains = this.physical.domains.concat(["edges", "norms",
     "verticies", "points", "position", "bounding", "area"]);
    if (!input) {
      return;
    }
    this.physical.position = (input.x != null) && (input.y != null) ?
     new Vector(input.x, input.y) : new Vector();
    this.physical.points = [];
    if (input.points != null) {
      this.setVerticies(input.points);
    }
    this.determineCenter();
    if (this.physical.verticies != null) {
      this.setEdges();
    }
    this.physical.bounding = [new Vector(), new Vector()];
    if (this.physical.verticies != null) {
      this.generateBounds();
    }
    return this.calcArea();
  };

  Shape.prototype.setVerticies = function(points) {
    var j, len1, point;
    if (!this.physical) {
      throw new Error("no physical");
    }
    this.physical.verticies = [];
    for (j = 0, len1 = points.length; j < len1; j++) {
      point = points[j];
      this.physical.verticies.push(new Vector(point[0], point[1]));
    }
  };

  Shape.prototype.setEdges = function() {
    var edge, i, i1, j, len1, n, n1, ref1;
    if (!this.physical) {
      throw new Error("no physical");
    }
    this.physical.edges = [];
    this.physical.norms = [];
    ref1 = this.physical.verticies;
    for (i1 = j = 0, len1 = ref1.length; j < len1; i1 = ++j) {
      i = ref1[i1];
      n1 = (i1 + 1) < this.physical.verticies.length ? i1 + 1 : 0;
      n = this.physical.verticies[n1];
      this.physical.edges.push(new Line(i, n));
      edge = this.physical.edges[i1];
      i.edge1 = i.edge1 || edge;
      n.edge2 = n.edge2 || edge;
      edge.getLength();
      this.physical.norms.push(edge.normal().vector().unit());
    }
  };

  Shape.prototype.setAppearance = function(input) {
    this.appearance.domains = this.appearance.domains.concat(
      ["fill", "strokeWidth", "strokeStyle"]);
    if (!input) {
      return;
    }
    // this.appearance.fill = input.fill != null ? input.fill : generateRandomColor();
    this.appearance.fill = input.fill == null ?
     generateRandomColor() : input.fill;
    this.appearance.strokeWidth = input.stroke == null ?
     null : input.stroke[0];
    // return this.appearance.strokeStyle = input.stroke != null ?
    //  input.stroke[1] : null;
    this.appearance.strokeStyle = input.stroke == null ?
     null : input.stroke[1];
  };

  Shape.prototype.get = function(item) {
    var component;
    var domain;
    var j;
    var len1;
    var len2;
    var p;
    var ref1;
    var ref2;
    ref1 = this.components;
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      component = ref1[j];
      ref2 = component.domains;
      for (p = 0, len2 = ref2.length; p < len2; p++) {
        domain = ref2[p];
        if (item === domain) {
          return component[item];
        }
      }
    }
  };

  Shape.prototype.set = function(item, val) {
    var component, domain, j, len1, len2, p, ref1, ref2;
    ref1 = this.components;
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      component = ref1[j];
      ref2 = component.domains;
      for (p = 0, len2 = ref2.length; p < len2; p++) {
        domain = ref2[p];
        if (item === domain) {
          component[item] = val;
          return true;
        }
      }
    }
    return false;
  };

  Shape.prototype.generateBounds = function() {
    var i, j, len1, maxX, maxY, minX, minY, ref1, temp;
    if (!this.physical.verticies) {
      throw new Error("no verticies");
    }
    maxX = -Infinity;
    maxY = -Infinity;
    minX = Infinity;
    minY = Infinity;
    ref1 = this.physical.verticies;
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      if ((temp = i.x) > maxX) {
        maxX = temp;
      }
      if ((temp = i.y) > maxY) {
        maxY = temp;
      }
      if ((temp = i.x) < minX) {
        minX = temp;
      }
      if ((temp = i.y) < minY) {
        minY = temp;
      }
    }
    this.physical.bounding[0].x = maxX + 10;
    this.physical.bounding[0].y = maxY + 10;
    this.physical.bounding[1].x = minX - 10;
    return this.physical.bounding[1].y = minY - 10;
  };

  Shape.prototype.determineCenter = function() {
    return this.physical.position =
    this.physical.position.centroid(this.physical.verticies);
  };

  Shape.prototype.determineinvMOI = function() {
    var i, i1, j, len1, points;
    points = this.physical.verticies.concat([]);
    for (i1 = j = 0, len1 = points.length; j < len1; i1 = ++j) {
      i = points[i1];
      points[i1] = i.subtract(this.physical.position);
    }
    return this.physical.position.invMOI(1, points);
  };

  Shape.prototype.calcArea = function() {
    return this.physical.area =
    abs(this.physical.position.sArea(this.physical.verticies));
  };

  Shape.prototype.inside = function(point) {
    var edge, i, i1, j, len1, ref1, vec;
    ref1 = this.physical.norms;
    for (i1 = j = 0, len1 = ref1.length; j < len1; i1 = ++j) {
      i = ref1[i1];
      edge = this.physical.edges[i1];
      vec = point.subtract(edge.p1);
      if (vec.dot(i) > 0) {
        return false;
      }
    }
    return true;
  };

  Shape.prototype.support = function(direction) {
    var i, index, j, len1, max, maxVec, ref1, tempMax;
    max = -Infinity;
    maxVec = null;
    index = null;
    ref1 = this.physical.verticies;
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      tempMax = i.subtract(this.physical.position);
      tempMax = direction.dot(tempMax);
      if (tempMax > max) {
        max = tempMax;
        maxVec = i;
      }
    }
    return maxVec;
  };

  Shape.prototype.move = function(obj) {
    var i, j, len1, len2, len3, p, q, ref1, ref2, ref3, results;
    if (obj != null) {
      this.physical.position.move(obj);
      ref1 = this.physical.bounding;
      for (j = 0, len1 = ref1.length; j < len1; j++) {
        i = ref1[j];
        i.move(obj);
      }
      ref2 = this.physical.verticies;
      for (p = 0, len2 = ref2.length; p < len2; p++) {
        i = ref2[p];
        i.move(obj);
      }
      ref3 = this.physical.points;
      results = [];
      for (q = 0, len3 = ref3.length; q < len3; q++) {
        i = ref3[q];
        results.push(i.move(obj));
      }
      return results;
    }
  };

  Shape.prototype.draw = function(ctx) {
    var i, i1, j, len1, ref1;
    ctx.beginPath();
    ctx.fillStyle = this.appearance.fill;
    ctx.strokeStyle = this.appearance.strokeStyle;
    ctx.lineWidth = this.appearance.strokeWidth;
    ctx.moveTo(this.physical.verticies[0].x, this.physical.verticies[0].y);
    ref1 = this.physical.verticies;
    for (i1 = j = 0, len1 = ref1.length; j < len1; i1 = ++j) {
      i = ref1[i1];
      if (!i1) {
        continue;
      }
      ctx.lineTo(i.x, i.y);
    }
    ctx.fill();
    if (this.appearance.strokeWidth) {
      return ctx.stroke();
    }
  };

  return Shape;
})();

Rectangle = (function(superClass) {
  extend(Rectangle, superClass);
  /**
   * class Rectangle: a 2 dimensional rectangle shape class stucture
   * @param {object} input an object containing all the relevant information for the creation of the rectangl3 (e.g: width).
   * @constructor
   */
  function Rectangle(input) {
    /**
     *             Format of input for Rectangle:
     *                @property width: 323 - setting the width of the rectangle
     *                @property height: 123 - setting the height of the rectangle
     *                @property invM:1/1.5, - setting the mass by setting its inverse,
     *                              the mass of this object is 1.5 units
     *                the moment of inertia is calculated automatically
     *                @property fill: "blue" - the color of the object, if one isnt
     *                             assigned, a random color will be chosen
     *                @property stroke: [1,"grey"] - the trim of the shape, if one isnt
     *                             assigned, there wont be any
     *                @property setLoc: true - setting the location of the shape using an input
     *                @property setVel: true - setting the velocity using input
     *                @property orient:0, - the initial orientation of the shape
     *                @property sf: 0.8, - the coefficient of static friction of the object
     *                @property df: 0.5, - the coefficient of dynamic friction of the object
     *                @property restitution: 0 - the coefficient of restitution of the object
     *                @property v:new Vector(-1,-0.5) - the intitial velocity, if not set
     *                @property x:400, - setting the location, if it isnt set, it will be
     *                @property y:200, - set automatically from the centers of its shapes
     */
    var dimX, dimY, first, i, j, points, pos, temp;
    temp = Object.create(input);
    if (!((temp.x != null) && (temp.y != null))) {
      throw new Error("no position coords");
    }
    if (!(temp.width && temp.height)) {
      throw new Error("no width and height");
    }
    if (temp.invM == null) {
      throw new Error("no mass");
    }
    temp.invI = (12 * temp.invM) / (sqr(temp.height) + sqr(temp.width));
    temp.shapes = [];
    first = temp.shapes[0] = {
      fill: temp.fill,
      stroke: temp.stroke,
      x: temp.x,
      y: temp.y
    };
    pos = new Vector(temp.x, temp.y);
    dimX = temp.width / 2;
    dimY = temp.height / 2;
    points = [
      [pos.x + dimX, pos.y + dimY],
      [pos.x + dimX, pos.y - dimY],
      [pos.x - dimX, pos.y - dimY],
      [pos.x - dimX, pos.y + dimY]
    ];
    first.points = points;
    Rectangle.__super__.constructor.call(this, temp);
    this.physical.invI = this.physical.invM * this.shapes[0].determineinvMOI();
    for (j = 0; j < this.shapes.length; j++) {
      i = this.shapes[j];
      i.shapeType = "Rectangle";
    }
    this.type = "Rectangle";
  }

  return Rectangle;
})(Body);

Circle = (function(superClass) {
  extend(Circle, superClass);
  /**
   * class Circle: a 2 dimensional circle shape class stucture
   * @param {object} input an object containing all the relevant information for the creation of the circle (e.g: width).
   * @constructor
   */
  function Circle(input) {
    /**
     *         FORMAT: for Circle
     *           @property radus: 323 - setting the radius of the circle
     *           @property invM:1/1.5, - setting the mass by setting its inverse,
     *                         the mass of this object is 1.5 units
     *           the moment of inertia is calculated automatically
     *           @property fill: "blue" - the color of the object, if one isnt
     *                        assigned, a random color will be chosen
     *           @property stroke: [1,"grey"] - the trim of the shape, if one isnt
     *                        assigned, there wont be any
     *           @property setLoc: true - setting the location of the shape using an input
     *           @property setVel: true - setting the velocity using input
     *           @property orient:0, - the initial orientation of the shape
     *           @property sf: 0.8, - the coefficient of static friction of the object
     *           @property df: 0.5, - the coefficient of dynamic friction of the object
     *           @property restitution: 0 - the coefficient of restitution of the object
     *           @property v:new Vector(-1,-0.5) - the intitial velocity, if not set
     *           @property x:400, - setting the location, if it isnt set, it will be
     *           @property y:200, - set automatically from the centers of its shapes
     */
    var first, i, j, len1, points, ref1, temp;
    temp = Object.create(input);
    if (!((temp.x != null) && (temp.y != null))) {
      throw new Error("no position coords");
    }
    if (!temp.radius) {
      throw new Error("no radius");
    }
    if (temp.invM == null) {
      throw new Error("no mass");
    }
    temp.invI = (2 * temp.invM) / (sqr(temp.radius));
    temp.shapes = [];
    first = temp.shapes[0] = {
      fill: temp.fill,
      stroke: temp.stroke,
      x: temp.x,
      y: temp.y,
      radius: temp.radius
    };
    points = [
      [first.x, first.y + temp.radius]
    ];
    first.points = points;
    Circle.__super__.constructor.call(this, temp);
    ref1 = this.shapes;
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      i.shapeType = "Circle";
    }
    this.shapes[0].physical.norms = [];
    this.type = "Circle";
    this.shapes[0].physical.position = new Vector(first.x, first.y);
    this.physical.position = new Vector(first.x, first.y);
    this.shapes[0].edges = [];
    this.shapes[0].physical.domains.push("radius");
    this.shapes[0].physical.radius = temp.radius;
    this.shapes[0].determineinvMOI = function() {
      return 2 / (sqr(temp.radius));
    };
    this.shapes[0].draw = function(ctx) {
      ctx.beginPath();
      ctx.fillStyle = this.appearance.fill;
      ctx.strokeStyle = this.appearance.strokeStyle;
      ctx.lineWidth = this.appearance.strokeWidth;
      ctx.arc(this.physical.position.x,
        this.physical.position.y,
        this.physical.radius,
        0,
        2 * pi);
      ctx.fill();
      if (this.appearance.strokeWidth) {
        ctx.stroke();
      }
      return new Line(this.physical.position, this.physical.verticies[0])
        .draw(1, "grey");
    };
    this.shapes[0].generateBounds = function() {
      var physical = this.physical;
      physical.bounding[0].x = physical.position.x + physical.radius + 10;
      physical.bounding[0].y = physical.position.y + physical.radius + 10;
      physical.bounding[1].x = physical.position.x - physical.radius - 10;
      physical.bounding[1].y = physical.position.y - physical.radius - 10;
    };
    this.shapes[0].support = function(direction) {
      if (!direction.length) {
        direction.getLength();
      }
      return direction.unit().scale(this.physical.radius)
      .add(this.physical.position);
    };
    this.shapes[0].inside = function(point) {
      return (point.subtract(this.physical.position).getLength()) <
       this.physical.radius;
    };
    this.shapes[0].calcArea = function() {
      return this.physical.area = pi * sqr(this.physical.radius);
    };
    this.shapes[0].determineCenter = function() {
      return this.physical.position;
    };
    this.determineinvMOI();
    this.determineCenter();
    this.generateBounds();
  }

  return Circle;
})(Body);

Demo = (function() {
  /**
   * class Demo: a class setting up the demo
   * @param {object} engine1   a reference to the engine object
   * @param {selector} selector1 a reference to the selector object
   * @param {object} context   a reference to the context object
   * @param {window} window1   a reference to the window object
   * @constructor
   */
  function Demo(engine1, selector1, context, window1) {
    this.engine = engine1;
    this.selector = selector1;
    this.context = context;
    this.window = window1;
    if (!this.engine) {
      throw new Error("Error: no engine");
    }
    if (!this.selector) {
      throw new Error("Error: no canvas");
    }
    if (!this.context) {
      throw new Error("Error: no context");
    }
    if (!this.window) {
      throw new Error("Error: no window");
    }
    if (!$) {
      throw new Error("Error: no jquery");
    }
    this.listeners = {};
    this.buttons = {};
    this.behaviours = {};
  }

  Demo.prototype.init = function() {
    this.setBehaviours();
    this.setPresets();
    this.setListeners();
    this.setButtonViews();
    return this.setButtons();
  };

  Demo.prototype.setBehaviours = function() {
    var cnc, i, j, len1, mouse, behaviours;
    behaviours = ["Drag", "Gravity", "PlayPause", "Refresh", "Cord", "AddShape",
     "Presets"];
    for (j = 0; j < behaviours.length; j++) {
      if (!eval(behaviours[j])) {
        throw new Error("Error: missing " + behaviours[j]);
      }
    }
    cnc = new CanvasControl(this.selector, this.context, this.window, "Jquery");
    cnc.activate(this.engine);
    mouse = new Mouse($("#canvasArea"), "Jquery", $(".navigation"));
    mouse.activate(this.engine);
    this.behaviours.drag = new Drag();
    this.behaviours.drag.set();
    this.behaviours.drag.activate(this.engine);
    this.behaviours.playPause = new PlayPause();
    this.behaviours.playPause.set(true);
    this.behaviours.playPause.activate(this.engine);
    this.behaviours.gravity = new Gravity();
    this.behaviours.gravity.set(0.008, new Vector(0, -1));
    this.behaviours.gravity.activate(this.engine);
    this.behaviours.refresh = new Refresh();
    this.behaviours.refresh.set(true);
    this.behaviours.refresh.activate(this.engine);
    this.behaviours.string = new Cord();
    this.behaviours.string.set({
      all: true,
      massOnly: true,
      maxLength: 100
    });
    return this.behaviours.string.activate(this.engine);
  };

  Demo.prototype.setPresets = function() {
    var addingShape, barrier, circ1_, circ2_, pr1, pr2, pr3, pr4, pr5, pr6,
      rect1_, rect2_, rect3_, setup;
    rect1_ = {
      type: "Rectangle",
      setLoc: true,
      setVel: true,
      x: 400,
      y: 200,
      width: 200,
      height: 30,
      invM: 1 / 1.5,
      orient: 0,
      sf: 0.8,
      df: 0.5,
      restitution: 0,
      v: new Vector(-1, -0.5)
    };
    rect2_ = {
      type: "Rectangle",
      x: 300,
      y: 200,
      setLoc: true,
      width: 50,
      height: 50,
      invM: 1 / 1,
      orient: -0.01,
      sf: 0.6,
      df: 0.4,
      restitution: 0,
      v: new Vector(0, 0.2)
    };
    rect3_ = {
      type: "Rectangle",
      x: 300,
      y: 200,
      setLoc: true,
      width: 40,
      height: 50,
      invM: 1 / 1,
      orient: -0.01,
      sf: 0.6,
      df: 0.4,
      restitution: 0,
      v: new Vector(0, 0.2)
    };
    circ1_ = {
      type: "Circle",
      radius: getRandomInt(30, 35),
      setLoc: true,
      x: 400,
      y: 200,
      restitution: 0,
      sf: 0.6,
      df: 0.4,
      invM: 1 / 1
    };
    circ2_ = {
      type: "Circle",
      radius: getRandomInt(5, 50),
      setLoc: true,
      x: 400,
      y: 200,
      restitution: 0,
      sf: 0.6,
      df: 0.4,
      invM: 1 / 2
    };
    pr1 = [circ1_, rect1_, "random"];
    pr2 = [rect1_, circ2_, "target"];
    pr3 = [rect1_, rect2_, "container"];
    pr4 = [rect2_, rect2_, "compound"];
    pr5 = [circ1_, circ2_, "container"];
    pr6 = [rect2_, rect1_, "target"];
    this.behaviours.presets = new Presets();
    this.behaviours.presets.add(pr6, AddShape);
    this.behaviours.presets.add(pr4, AddShape);
    this.behaviours.presets.add(pr3, AddShape);
    this.behaviours.presets.add(pr2, AddShape);
    this.behaviours.presets.activate(this.engine);
    addingShape = new AddShape();
    barrier = {
      type: "Rectangle",
      x: 47,
      y: 100,
      width: 900,
      height: 50,
      invM: 0,
      orient: 0.0,
      sf: 0.8,
      df: 0.7,
      restitution: 0
    };
    setup = (function(_this) {
      return function() {
        return _this.engine.implement(addingShape.createShape(barrier));
      };
    })(this);
    this.engine.on("refresh", setup, this);
    return setup();
  };

  Demo.prototype.setListeners = function() {
    this.listeners.play = function(event) {
      var button, engine;
      engine = event.data.engine;
      button = event.data.button;
      return engine.emit("play", {
        cursor: new Vector(engine.pageX, engine.pageY),
        engine: engine
      });
    };
    this.listeners.pause = function(event) {
      var button, engine;
      engine = event.data.engine;
      button = event.data.button;
      return engine.emit("pause", {
        cursor: new Vector(engine.pageX, engine.pageY),
        engine: engine
      });
    };

    /*
    @engine.on "play",()->
        if not @buttons.play.isChecked()
            @buttons.play.alter true
    ,@
    @engine.on "pause",()->
        if not @buttons.pause.isChecked()
            @buttons.pause.alter true
    ,@
     */
    this.listeners.gravitate = function(event) {
      var button, engine;
      engine = event.data.engine;
      button = event.data.button;
      return engine.emit("gravitate", {
        cursor: new Vector(engine.pageX, engine.pageY),
        engine: engine
      });
    };
    this.listeners.degravitate = function(event) {
      var button, engine;
      engine = event.data.engine;
      button = event.data.button;
      return engine.emit("degravitate", {
        cursor: new Vector(engine.pageX, engine.pageY),
        engine: engine
      });
    };

    /*
    @engine.on "refresh",()->
        if @buttons.gravity.isChecked()
            @buttons.gravity.alter false
        if @buttons.string.isChecked()
            @buttons.string.alter false
    ,@
     */
    this.listeners.refresh = function(event) {
      var engine;
      engine = event.data.engine;
      return engine.emit("refresh", {
        cursor: new Vector(engine.pageX, engine.pageY),
        engine: engine
      });
    };
    this.listeners.stringify = function(event) {
      var button, engine;
      engine = event.data.engine;
      button = event.data.button;
      return engine.emit("stringify", {
        cursor: new Vector(engine.pageX, engine.pageY),
        engine: engine
      });
    };
    this.listeners.destringify = function(event) {
      var button, engine;
      engine = event.data.engine;
      button = event.data.button;
      return engine.emit("destringify", {
        cursor: new Vector(engine.pageX, engine.pageY),
        engine: engine
      });
    };
    this.listeners.presets = function(event) {
      var behaviour, button, engine, index;
      engine = event.data.engine;
      button = event.data.button;
      behaviour = event.data.behaviour;
      engine.emit("refresh", {
        cursor: new Vector(engine.pageX, engine.pageY),
        engine: engine
      });
      index = button.index;
      return behaviour.choose(index);
    };
  };

  Demo.prototype.setButtonViews = function() {
    var applyingClass, hideStuff, hideStuff3, i, j, len1, ref1, removingClass;
    applyingClass = function(selector, classToApply, e) {
      return selector.addClass(classToApply);
    };
    removingClass = function(selector, classToApply, e) {
      return selector.removeClass(classToApply);
    };
    this.buttons.refresh = new Action("refresh", "#refresh");
    this.engine.on("refresh", function() {
      var i, j, len1, ref1, results;
      ref1 = [this.buttons.gravity, this.buttons.string, this.buttons.play];
      results = [];
      for (j = 0, len1 = ref1.length; j < len1; j++) {
        i = ref1[j];
        if (i.activated) {
          removingClass.bind(null, i.selector[1], "applied")();
          results.push(i.activated = false);
        } else {
          results.push(undefined);
        }
      }
      return results;
    }, this);
    this.buttons.play = new Toggle("playPause", "#play");
    this.buttons.play.setListener("click", null,
     applyingClass.bind(null, this.buttons.play.selector[0], "applied"),
      removingClass.bind(null, this.buttons.play.selector[1], "applied"));
    this.buttons.gravity = new Toggle("gravity", "#gravity");
    this.buttons.gravity.setListener("click", null,
     applyingClass.bind(null, this.buttons.gravity.selector[0], "applied"),
      removingClass.bind(null, this.buttons.gravity.selector[1], "applied"));
    this.buttons.string = new Toggle("string", "#string");
    this.buttons.string.setListener("click", null,
     applyingClass.bind(null, this.buttons.string.selector[0], "applied"),
      removingClass.bind(null, this.buttons.string.selector[1], "applied"));
    this.buttons.presets = new Radio("presets", ".presets");
    ref1 = this.buttons.presets.options;
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      i.setListener("click", null,
       applyingClass.bind(null, i.selector[0], "applied"));
      i.setListener("internal", null, null,
       removingClass.bind(null, i.selector[1], "applied"));
    }
    this.buttons.hideOptions = new Toggle("hideOptions", "#options1");
    hideStuff = function(selectors, classToApply, fn, typeOfHidden, e) {
      var index, len2, p, results, selector;
      results = [];
      for (index = p = 0, len2 = selectors.length; p < len2; index = ++p) {
        i = selectors[index];
        selector = selectors.eq(index);
        results.push(fn(selector, typeOfHidden));
      }
      return results;
    };
    this.buttons.hideOptions.setListener("click", null,
      hideStuff.bind(null, $(".options1"), "applied", applyingClass,
       "sideHidden"), hideStuff.bind(null, $(".options1"), "applied",
        removingClass, "sideHidden"));
    this.buttons.hideOptions.setListener("click", null,
      removingClass.bind(null, this.buttons.hideOptions.selector[0],
         "optioned"), applyingClass.bind(null,
            this.buttons.hideOptions.selector[1], "optioned"));

    /*
    @buttons.presetView1 = new Toggle("presetView1","#presetHead")
    hideStuff2 = (selectors,classToApply,fn,typeOfHidden,e)->
        for i,index in selectors
            selector = selectors.eq(index)
            fn selector,typeOfHidden
    @buttons.presetView1.setListener "click",null,hideStuff2.bind(null,$(".presets"),"applied",applyingClass,"topHidden")
        ,hideStuff2.bind(null,$(".presets"),"applied",removingClass,"topHidden")
     */
    this.buttons.presetView2 = new Button("presetView2", ".dropdown");
    hideStuff3 = function(selectors, classToApply, fn, typeOfHidden, e) {
      var index, len2, p, results, selector;
      results = [];
      for (index = p = 0, len2 = selectors.length; p < len2; index = ++p) {
        i = selectors[index];
        selector = selectors.eq(index);
        results.push(fn(selector, typeOfHidden));
      }
      return results;
    };
    this.buttons.presetView2.setListener("mouseenter", null,
     hideStuff3.bind(null, $(".presets"),
      "applied", removingClass, "topHidden"));
    return this.buttons.presetView2.assignDeactivation("mouseleave", null,
     hideStuff3.bind(null, $(".presets"), "applied", applyingClass,
      "topHidden"));
  };

  Demo.prototype.setButtons = function() {
    var i, j, len1, ref1, results;
    this.buttons.play.setListener("click", {
      engine: this.engine,
      button: this.buttons.play
    }, this.listeners.play, this.listeners.pause);
    this.buttons.gravity.setListener("click", {
      engine: this.engine,
      button: this.buttons.gravity
    }, this.listeners.gravitate, this.listeners.degravitate);
    this.buttons.refresh.setListener("click", {
      engine: this.engine,
      button: this.buttons.refresh
    }, this.listeners.refresh);
    this.buttons.string.setListener("click", {
      engine: this.engine,
      button: this.buttons.string
    }, this.listeners.stringify, this.listeners.destringify);
    ref1 = this.buttons.presets.options;
    results = [];
    for (j = 0, len1 = ref1.length; j < len1; j++) {
      i = ref1[j];
      results.push(i.setListener("click", {
        engine: this.engine,
        button: i,
        behaviour: this.behaviours.presets
      }, this.listeners.presets));
    }
    return results;
  };

  return Demo;
})();

var world = window.world = new Engine();

demo = new Demo(world, jcan, ctxx, win);

demo.init();

new CollisionControl().activate(world);

new AABB().activate(world);

new SATColl().activate(world);

new ImpulseResolution().activate(world);

test3 = new Rectangle({
  invM: 1 / 1.5,
  orient: 0,
  sf: 0.8,
  df: 0.5,
  restitution: 0,
  v: new Vector(-0.1, -0.1),
  x: 300,
  y: 200,
  width: 54,
  height: 175
});

test2 = new Rectangle({
  invM: 1 / 1.5,
  orient: 0,
  sf: 0.8,
  df: 0.5,
  restitution: 0,
  v: new Vector(-0.1, -0.1),
  x: 200,
  y: 200,
  width: 50,
  height: 89
});

test4 = new Rectangle({
  invM: 1 / 1.5,
  orient: 0,
  sf: 0.8,
  df: 0.5,
  restitution: 0,
  v: new Vector(-0.1, -0.1),
  x: 300,
  y: 200,
  width: 50,
  height: 89
});

test1 = new Circle({
  invM: 1 / 1.5,
  orient: 0,
  sf: 0.8,
  df: 0.5,
  restitution: 0,
  v: new Vector(-0.1, -0.1),
  x: 600,
  y: 200,
  radius: 40
});

shape2 = test2.shapes[0];

shape3 = test3.shapes[0];

shape1 = test1.shapes[0];

test4.addShape(shape1);

test4.addShape(shape2);

// ---
// generated by coffee-script 1.9.2
