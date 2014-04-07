

all: www/js/trigram.js www/js/shell.js www/js/jquery.js

www/js/trigram.js: trigram/*.coffee
	coffee -j www/js/trigram.js -c trigram/reg.coffee trigram/mem.coffee trigram/decoder.coffee trigram/lc3.coffee

www/js/shell.js: shell/*.coffee
	coffee -j www/js/shell.js -c shell/*.coffee

www/js/jquery.js: third/jquery.js
	cp third/jquery.js www/js/jquery.js

clean:
	rm www/js/*.js