FROM alpine/git AS base

ARG TAG=latest
RUN git clone https://github.com/marcrobledo/RomPatcher.js.git && \
    cd RomPatcher.js && \
    ([[ "$TAG" = "latest" ]] || git checkout ${TAG}) && \
    rm -rf .git

FROM pierrezemb/gostatic

COPY --from=base /git/RomPatcher.js /srv/http
EXPOSE 8043
