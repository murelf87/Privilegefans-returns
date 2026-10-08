import { cp, mkdir, rm } from 'node:fs/promises';
import { resolve } from 'node:path';
const here=resolve(import.meta.dirname,'..');
const src=resolve(here,'..');
const out=resolve(here,'www');
await rm(out,{recursive:true,force:true}); await mkdir(out,{recursive:true});
const names=['index.html','app.js','config.js','styles.css','rc8-header.css','rc8-header.js','mobile-app.css','mobile-app.js','manifest.webmanifest','sw.js','assets'];
for(const n of names) await cp(resolve(src,n),resolve(out,n),{recursive:true});
console.log('WEB_PREPARED='+out);
