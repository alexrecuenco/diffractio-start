# Running jupyter in docker

This docker installation should install your requirements on build and then run

## Creating the image
```sh
docker  compose build
```

Whenever you change the requirements, run `docker compose build` again.

## Running

```sh
docker compose up
```

You will get a URL that looks like

```text
http://127.0.0.1:8888/lab?token=0cd46108862dbfb77cb67c0492c7f88be552755fb4a81cfb
```

Click on it!
If this url does not work, that is because you started some other notebook on the same port, 8888. This happens if you have tried both methods and forgot to turn one off.