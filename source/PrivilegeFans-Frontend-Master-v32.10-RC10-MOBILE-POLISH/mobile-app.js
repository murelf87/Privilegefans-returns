/* PrivilegeFans v32.10-RC9-MOBILE — mobile runtime helpers */
(()=>{
  const ua=navigator.userAgent||'';
  const isIOS=/iPhone|iPad|iPod/i.test(ua) || (navigator.platform==='MacIntel' && navigator.maxTouchPoints>1);
  const isAndroid=/Android/i.test(ua);
  const isStandalone=matchMedia('(display-mode: standalone)').matches || navigator.standalone===true;
  const isNative=location.protocol==='capacitor:' || location.protocol==='ionic:' || !!window.Capacitor?.isNativePlatform?.();
  document.body.classList.add('pf-mobile-app');
  if(isIOS) document.body.classList.add('pf-platform-ios');
  if(isAndroid) document.body.classList.add('pf-platform-android');
  if(isStandalone) document.body.classList.add('pf-standalone');
  if(isNative) document.body.classList.add('pf-native-app',isIOS?'pf-native-ios':isAndroid?'pf-native-android':'pf-native');

  const syncVh=()=>document.documentElement.style.setProperty('--pf-vh',`${window.innerHeight*.01}px`);
  syncVh(); addEventListener('resize',syncVh,{passive:true});
  if(window.visualViewport){
    const syncKeyboard=()=>{
      const delta=window.innerHeight-window.visualViewport.height;
      document.body.classList.toggle('pf-keyboard-open',delta>140);
    };
    visualViewport.addEventListener('resize',syncKeyboard,{passive:true});
    visualViewport.addEventListener('scroll',syncKeyboard,{passive:true});
  }

  document.addEventListener('focusin',e=>{
    if(/^(INPUT|TEXTAREA|SELECT)$/.test(e.target?.tagName||'')){
      setTimeout(()=>e.target.scrollIntoView({block:'center',behavior:'smooth'}),260);
    }
  });

  // Keep external links outside the app shell while internal routes stay in PrivilegeFans.
  document.addEventListener('click',e=>{
    const a=e.target.closest('a[href]'); if(!a) return;
    const href=a.getAttribute('href')||'';
    if(/^https?:\/\//i.test(href) && !href.includes(location.host)) a.setAttribute('target','_blank');
  },true);

  // Android hardware back compatibility when Capacitor exposes the App plugin globally.
  try{
    const appPlugin=window.Capacitor?.Plugins?.App;
    if(appPlugin?.addListener){
      appPlugin.addListener('backButton',({canGoBack})=>{
        const open=document.querySelector('.modal-backdrop,.drawer-backdrop');
        if(open){ document.querySelector('.modal-close,[data-action="close-modal"],[data-action="close-drawer"]')?.click(); return; }
        if(canGoBack || location.hash!=='#/trending') history.back();
        else appPlugin.exitApp?.();
      });
    }
  }catch(_){ }
})();
