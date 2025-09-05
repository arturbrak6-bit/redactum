FROM rocker/r-ver:4.4.1

# libs de sistema comuns
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev libssl-dev libxml2-dev libfontconfig1-dev \
    libpng-dev libjpeg-dev libtiff5-dev libfreetype6-dev libharfbuzz-dev libfribidi-dev \
  && rm -rf /var/lib/apt/lists/*

# pacotes R base (adicione mais conforme os logs pedirem)
RUN R -e "install.packages(c('shiny','bslib','htmltools','DT','dplyr','readr','tidyr','stringr','lubridate','ggplot2','shinydashboard'), repos='https://cloud.r-project.org')"

WORKDIR /app
COPY . /app

ENV PORT=8080
EXPOSE 8080

# Como agora temos app.R na raiz, rodamos a pasta /app
CMD ["R","-e","options(shiny.host='0.0.0.0', shiny.port=as.integer(Sys.getenv('PORT'))); shiny::runApp('/app')"]
