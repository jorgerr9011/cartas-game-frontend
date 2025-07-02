# Muestra los comandos disponibles
default:
    @echo ""
    @echo "Comandos disponibles:"
    @echo ""
    @echo "  just install                   Obtiene imágenes docker y despliega el proyecto"
    @echo "  just init                      Despliega el proyecto"
    @echo "  just copy-env-dev              Copia las variables de entorno de desarrollo en el .env principal"
    @echo "  just copy-env-prod              Copia las variables de entorno de producción en el .env principal"
    @echo "  just migrate                   Ejecuta las migraciones"
    @echo "  just migrate-production        Ejecuta las migraciones en producción"
    @echo "  just destroy                   Detiene y elimina contenedores, volúmenes y redes del proyecto"
    @echo "  just clean-containers          Detiene y elimina contenedores y redes, sin borrar volúmenes"
    @echo "  just clean-images              Elimina imágenes locales del proyecto"
    @echo "  just clean-stopped-containers  Elimina todos los contenedores detenidos"
    @echo "  just clean-unused-volumes      Elimina volúmenes no usados por contenedores"
    @echo "  just clean-unused-networks     Elimina redes no usadas"
    @echo "  just clean-all                 Limpieza completa: contenedores, imágenes, volúmenes y redes"

install: 
    docker compose -f docker-compose.yml up --build -d

init: 
    docker compose -f docker-compose.yml up -d

clean-containers:
    docker compose -f docker-compose.yml down
    
destroy:
    docker compose -f docker-compose.yml down -v --remove-orphans

clean-images:
    docker image prune -af

clean-stopped-containers:
    docker container prune -f

clean-unused-volumes:
    docker volume prune -f

clean-unused-networks:
    docker network prune -f

clean-all:
    docker compose -f docker-compose.yml down -v --remove-orphans
    docker image prune -af
    docker container prune -f
    docker volume prune -f
    docker network prune -f