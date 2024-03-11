FROM alpine/git AS base

ARG TAG=latest
RUN git clone https://github.com/marcrobledo/RomPatcher.js.git && \
    cd RomPatcher.js && \
    ([[ "$TAG" = "latest" ]] || git checkout ${TAG}) && \
    rm -rf .git

FROM lipanski/docker-static-website

COPY --from=base /git/RomPatcher.js .
