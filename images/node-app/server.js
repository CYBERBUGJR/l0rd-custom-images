const http = require('http');
const url = require('url');

const port = process.env.PORT || 3000;

const server = http.createServer((req, res) => {
  const parsedUrl = url.parse(req.url, true);
  
  res.writeHead(200, { 'Content-Type': 'application/json' });
  
  if (parsedUrl.pathname === '/health') {
    res.end(JSON.stringify({
      status: 'healthy',
      uptime: process.uptime(),
      timestamp: new Date().toISOString()
    }));
  } else {
    res.end(JSON.stringify({
      message: '🚀 L0rd Custom Node.js App',
      description: 'This is a custom Node.js application built from the l0rd-custom-images repository.',
      status: 'running',
      timestamp: new Date().toISOString()
    }));
  }
});

server.listen(port, () => {
  console.log(`🚀 L0rd Node.js app listening on port ${port}`);
});