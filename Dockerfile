# fork from https://zenn.dev/hikarin/articles/dc3f820c020190
FROM steamcmd/steamcmd:debian-12 AS build

RUN steamcmd +login anonymous +app_update 2394010 validate +quit

FROM gcr.io/distroless/cc-debian12:nonroot AS base

COPY --from=build --chown=nonroot /root/.local/share/Steam/steamapps/common/PalServer/ PalServer/
COPY --from=build /root/.steam/sdk64/steamclient.so .steam/sdk64/
COPY --from=build /root/.steam/sdk32/steamclient.so .steam/sdk32/

EXPOSE 8211/udp
VOLUME /home/nonroot/PalServer/Pal/Saved

ENTRYPOINT ["PalServer/PalServer.sh"]
CMD ["-useperfthreads", "-NoAsyncLoadingThread", "-UseMultithreadForDS"]
