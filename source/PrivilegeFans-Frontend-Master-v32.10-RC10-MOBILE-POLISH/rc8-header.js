(()=>{
  'use strict';

  function ensureTabletChat(){
    const actions=document.querySelector('.mobile-head-actions');
    if(!actions || actions.querySelector('.mobile-head-chat')) return;
    const chat=document.createElement('button');
    chat.className='mobile-head-btn mobile-head-chat';
    chat.type='button';
    chat.dataset.route='mensajes';
    chat.setAttribute('aria-label','Chat');
    chat.innerHTML='<i class="fa-solid fa-comment"></i>';
    const search=actions.querySelector('[data-action="focus-search"]');
    if(search) search.insertAdjacentElement('afterend',chat); else actions.prepend(chat);
  }

  function syncAccountAvatar(){
    const source=document.querySelector('.mobile-head-actions [data-action="account"] .avatar-mini');
    const target=document.querySelector('.account-head .avatar-mini');
    if(source?.src && target && target.src!==source.src) target.src=source.src;
  }

  function syncBrandFallback(){
    const img=document.querySelector('.brand img');
    const fallback=document.querySelector('.brand-word');
    if(!img || !fallback) return;
    const showFallback=()=>{fallback.style.display='inline';};
    const hideFallback=()=>{fallback.style.display='none';};
    img.addEventListener('error',showFallback,{once:true});
    img.addEventListener('load',hideFallback,{once:true});
    if(img.complete) (img.naturalWidth>0?hideFallback:showFallback)();
  }

  function syncHeader(){
    ensureTabletChat();
    syncAccountAvatar();
    syncBrandFallback();
  }

  document.addEventListener('click',e=>{
    const trigger=e.target.closest('[data-action="focus-search"]');
    if(!trigger) return;
    const input=document.querySelector('#global-search');
    const box=input?.closest('.search');
    if(!input || !box) return;
    box.classList.add('mobile-search-open');
    requestAnimationFrame(()=>input.focus({preventScroll:true}));
    const close=()=>box.classList.remove('mobile-search-open');
    input.addEventListener('blur',()=>setTimeout(close,160),{once:true});
    input.addEventListener('keydown',ev=>{if(ev.key==='Escape'){close();input.blur();}},{once:true});
  },true);

  const root=document.querySelector('#app')||document.body;
  new MutationObserver(syncHeader).observe(root,{childList:true,subtree:true});
  syncHeader();
})();
