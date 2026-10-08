const PF_NATIVE_MOBILE = ['capacitor:','ionic:'].includes(location.protocol) || !!window.Capacitor?.isNativePlatform?.();
window.PF_CONFIG = {
  apiBaseUrl: PF_NATIVE_MOBILE ? 'https://beta.privilegefans.com/api' : '/api',
  demoMode: false,
  allowDemoFallback: false,
  version: '32.10-RC10-MOBILE-POLISH',
  termsVersion: '2026-09',
  beta: true,
  ageGate: true,
  brand: { blue:'#154C82', blueDark:'#0F3654', gold:'#F0C12C', goldMuted:'#B18937' }
};
