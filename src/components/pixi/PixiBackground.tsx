import { useEffect, useRef } from 'react';
import { startPixiAppWithBackground } from './PixiAppBackground';

export const PixiBackground = () => {
  const containerRef = useRef<HTMLDivElement>(null);
  const appRef = useRef<any>(null);

  useEffect(() => {
    if (!containerRef.current) return;

    startPixiAppWithBackground(containerRef.current).then(app => {
      appRef.current = app;
    });

    return () => {
      appRef.current?.destroy(true, { children: true, texture: true, baseTexture: true });
    };
  }, []);

  return <div ref={containerRef} style={{ width: '100%', height: '100vh' }} />;
};
