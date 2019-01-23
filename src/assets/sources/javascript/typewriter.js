function Typewriter(el, str, delay) {
    if (!(this instanceof Typewriter)) return new Typewriter(el, str, delay);

    this.el = el;
    this.str = str || el.innerHTML || el.value;
    this.delay = delay || 100;
    this.i = 0;
}


Typewriter.prototype.type = function () {
    var i = this.i,
        char = this.str.charAt(i);

    if (!char) {
        clearInterval(this.intervalID);
        return this;
    }

    if( char === '<' ) this.isTag = true;
    if( char === '>' ) this.isTag = false;

    this.el.innerHTML += char;
    return this.i++;
};

Typewriter.prototype.start = function () {
    var self = this;
    if (this.i < 0) this.i = 0;
    if (this.el.innerHTML === this.str) this.clear();

    (function loop(){
        self.type();
        if(self.isTag) return loop();
        self.intervalID = setTimeout(loop, self.delay);
    }());

    return this;
};

Typewriter.prototype.stop = function () {
    this.i = -1;
    return this;
};


Typewriter.prototype.restart = function () {
    this.clear();
    this.i = 0;
    return this.start();
};



Typewriter.prototype.clear = function () {
    this.el.innerHTML = '';
    return this;
};