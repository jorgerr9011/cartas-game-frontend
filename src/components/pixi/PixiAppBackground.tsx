import { Application, Graphics } from 'pixi.js';

export async function startPixiAppWithBackground(container: HTMLElement) {
  const app = new Application();
  await app.init({ backgroundAlpha: 0, resizeTo: window });

  container.appendChild(app.canvas);

  // Crear un fondo como un rectángulo del tamaño de la pantalla
  const background = new Graphics();
  background.beginFill(0x1d3557); // Azul oscuro (usa código hexadecimal)
  background.drawRect(0, 0, app.screen.width, app.screen.height);
  background.endFill();

  app.stage.addChild(background);

  return app;
}
