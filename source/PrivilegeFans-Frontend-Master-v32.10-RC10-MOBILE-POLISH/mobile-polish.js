/* PrivilegeFans v32.10-RC10-MOBILE-POLISH — ajustes visuales sin tocar contratos API */
(()=>{
  const apply=()=>{
    if(!matchMedia('(max-width:720px)').matches) return;
    document.body.classList.add('pf-mobile-polished');
  };
  apply();
  const mo=new MutationObserver(()=>apply());
  mo.observe(document.getElementById('app')||document.body,{childList:true,subtree:true});
})();
