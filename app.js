const http = require('http');
const os = require('os');

console.log("App is running");

var handler = function(request, response) {
	response.writeHead(200);
	response.end("You're on the terencec branch \nWelcome !");
};

var www = http.createServer(handler);
www.listen(8080);
