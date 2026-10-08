import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.privilegefans.app',
  appName: 'PrivilegeFans',
  webDir: 'www',
  bundledWebRuntime: false,
  server: {
    hostname: 'localhost',
    androidScheme: 'https',
    cleartext: false
  },
  ios: { contentInset: 'automatic' },
  android: { allowMixedContent: false },
  plugins: {
    SplashScreen: { launchAutoHide: true, launchShowDuration: 1100, backgroundColor: '#F6F8FB' },
    StatusBar: { style: 'DARK' },
    Keyboard: { resize: 'native', resizeOnFullScreen: true }
  }
};
export default config;
