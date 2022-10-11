const http = require("http");
const fs = require("fs");
const os = require("os");
const ip = require('ip');

const server = http.createServer((req, res) => {
    if (req.url === "/") {
        fs.readFile("./Public/index.html", "UTF-8", (err, body) => {
          res.writeHead(200, {"Content-Type": "text/html"});
          res.end(body);
        });
     } else if(req.url.match("/sysinfo")) {
        myHostName=os.hostname();
        const totalMemory = os.totalmem() / 1000000
        const freeMemory = os.freemem() / 1000000
        const upTime = process.uptime()
        const numberOfCPUs = os.cpus().length
        html=`
        <!DOCTYPE html>
        <html>
            <head>
                <title>Node JS Response</title>
            </head>
            <body>
                <p>Hostname: ${myHostName}</p>
                <p>IP: ${ip.address()}</p>
                <p>Server Uptime: ${upTime} Seconds</p>
                <p>Total Memory: ${totalMemory} Megabytes</p>
                <p>Free Memory: ${freeMemory} Megabytes</p>
                <p>Number of CPUs: ${numberOfCPUs} CPUs</p>
            </body>
        </html>`
        res.writeHead(200, {"Content-Type": "text/html"});
        res.end(html);
        } else { 
            res.writeHead(404, {"Content-Type": "text/plain"});
            res.end(`404 File Not Found at ${req.url}`);
        }
}).listen(3000);

console.log("Server listening on port 3000");