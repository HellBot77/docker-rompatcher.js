FROM alpine/git AS build

ARG TAG=latest
RUN git clone https://github.com/marcrobledo/RomPatcher.js.git && \
    cd RomPatcher.js && \
    ([[ "$TAG" = "latest" ]] || git checkout ${TAG}) && \
    rm -rf .git

FROM pierrezemb/gostatic

COPY --from=build /git/RomPatcher.js /srv/http
EXPOSE 8043