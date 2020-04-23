
import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
  stages: [
    { duration: '70s', target: 100 },
    { duration: '1m30s', target: 3000 },
    { duration: '20s', target: 40 },
  ],
};

export default function() {
  let res = http.get('http://ne.kube.rukjaana.com/');
  check(res, { 'status was 200': r => r.status == 200 });
  sleep(1);
}