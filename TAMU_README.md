# Open ONI (Customized for Texas A&M University)

## About

This project is forked from James Sullivan's [open-oni/customizations](https://github.com/jameswsullivan/open-oni/tree/customizations) repo and customized for Texas A&M University.

## Customizations

- Created `compose-tamu.yaml` for TAMU specific configurations.
- Instead of using `docker volumes` in `compose-tamu.yaml`, two folders `../theme` and `../featured_content` are mounted at `/opt/openoni/themes/tamu` and `/opt/openoni/onisite/plugins/featured_content`, respectively, for ease of development.

## Run Locally with Docker Compose for Development

#### Directory Setup:
- `openoni`
    - `app`: Clone [open-oni-tamu](https://github.com/JamesS-TAMU/open-oni-tamu) into this folder, switch to `tamu-customizations` branch (default).
    - `theme`: Clone [open-oni-theme-tamu](https://github.com/JamesS-TAMU/open-oni-theme-tamu) into this folder. 
    - `featured_content`: Clone [open-oni-featured-content-tamu](https://github.com/JamesS-TAMU/open-oni-featured-content-tamu) into this folder, switch to `tamu` branch (default).

#### Start/Stop Containers
```
docker compose --file compose-tamu.yaml up -d

docker compose down -v
```