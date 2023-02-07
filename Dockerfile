ARG MKDOCS_MATERIAL_VERSION
FROM ghcr.io/marcelmaatkamp/mkdocs-material-jupyter:${MKDOCS_MATERIAL_VERSION}

COPY requirements.in requirements.in
RUN \
  pip install --upgrade --no-cache \
    pip \
    pip-tools &&\
  pip-compile requirements.in \
    --resolver=backtracking \
    --max-rounds 20  \
    --verbose &&\
  pip install -r requirements.in


EXPOSE 8000
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]