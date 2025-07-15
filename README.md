# Open ONI (Customized)

## Original Project

- This repo is forked from the [open-oni](https://github.com/open-oni/open-oni) project.
- See the [original readme here](https://github.com/open-oni/open-oni/blob/dev/README.md)
- [Customizations](https://github.com/TAMULib/open-oni/blob/tamu_prod/CUSTOMIZATIONS.md)

## Run Open ONI with `docker compose`

Note: The `manager` service has to be started first for necessary files to be copied into the `/opt/openoni` folder before the `web` service can successfully start.

### Start Instance
```
docker compose up -d
```

### Stop Instance
```
docker compose down
or
docker compose down -v
```

### Load and Purge Batches
```
docker exec -it openoni-web bash
cd /opt/openoni
source ENV/bin/activate
```

Use the `batch_load_batches.sh` to load existing tamu batches during initial setup.
Use:
```
./manage.py load_batch /opt/openoni/data/batches/<batch_name>/
chmod -R 777 /var/tmp/django_cache
```
to load individual batches on-demand.

Use:
```
./manage.py <batch_name>
chmod -R 777 /var/tmp/django_cache
```
to purge a batch.

### Compile Themes

After the theme is modified (and `git pull`'d), it needs to be compiled first before the modifications will show up.

```
docker exec -it openoni-web bash
cd /opt/openoni
./compile_themes.sh
```

