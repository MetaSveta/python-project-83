PORT ?= 8000

install:
	uv sync
	npm ci

# проверка готовит приложение к тестам
setup: install build-css

# образ на render собирается этой целью
build: install build-css

build-css:
	npm run build:css

dev:
	uv run flask --debug --app page_analyzer:app run

start:
	uv run gunicorn -w 5 -b 0.0.0.0:$(PORT) page_analyzer:app

render-start:
	uv run gunicorn -w 1 -b 0.0.0.0:$(PORT) page_analyzer:app

lint:
	uv run ruff check .