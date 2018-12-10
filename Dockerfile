FROM squidfunk/mkdocs-material

COPY /mkdocs /docs

CMD ["serve", "--dev-addr=0.0.0.0:8000", "--no-livereload"]