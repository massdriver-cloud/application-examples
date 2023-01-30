// Use a loop, use reflection, mmhmm. PRs welcome. :)
function initFromConnections() {
  let backends = [];

  if (process.env.BACKEND0) {
    backends.push(process.env.BACKEND0);
  }
  if (process.env.BACKEND1) {
    backends.push(process.env.BACKEND1);
  }
  if (process.env.BACKEND2) {
    backends.push(process.env.BACKEND2);
  }
  if (process.env.BACKEND3) {
    backends.push(process.env.BACKEND3);
  }
  if (process.env.BACKEND4) {
    backends.push(process.env.BACKEND4);
  }

  return backends;
}

function initBackends() {
  let backends = initFromConnections();

  if (process.env.BACKENDS) {
    backends = process.env.BACKENDS.split(',');
    return;
  }

  return backends;
}

export {
  initBackends,
};
