FROM rocker/r-ver:4.4.1
ENV DEBIAN_FRONTEND=noninteractive

# Libs de sistema abrangentes (evita a maioria dos erros)
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev libssl-dev libxml2-dev libfontconfig1-dev \
    libpng-dev libjpeg-dev libtiff5-dev libfreetype6-dev libharfbuzz-dev libfribidi-dev \
    libv8-dev libmagick++-dev \
    libgdal-dev libgeos-dev libproj-dev \
    unixodbc-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

# Pacotes comuns de Shiny
RUN R -e "install.packages(c( \
  'shiny','bslib','htmltools','DT','dplyr','readr','tidyr','stringr','lubridate','ggplot2','shinydashboard', \
  'shinythemes','shinyWidgets','shinyjs','waiter','plotly','leaflet','leaflet.extras', \
  'readxl','openxlsx','httr','jsonlite' \
), repos='https://cloud.r-project.org')"

# Detecta library()/require() e instala extras
RUN R -e "files <- list.files('/app', pattern='\\.[Rr]$', recursive=TRUE, full.names=TRUE); \
          txt <- unlist(lapply(files, readLines, warn=FALSE)); \
          m <- gregexpr('(library|require)\\s*\\(([^\\)]+)\\)', txt, perl=TRUE); \
          calls <- unlist(regmatches(txt, m)); \
          pkgs <- unique(unlist(lapply(calls, function(x){s <- sub('.*\\(([^\\)]+)\\).*','\\1', x); s <- gsub('[\\\"\\'\\s]', '', s); strsplit(s, ',')[[1]];}))); \
          pkgs <- pkgs[nzchar(pkgs)]; \
          need <- setdiff(unique(pkgs), rownames(installed.packages())); \
          if(length(need)) install.packages(need, repos='https://cloud.r-project.org'); \
          message('Pacotes extras instalados: ', paste(need, collapse=', '))"

ENV PORT=8080
EXPOSE 8080
CMD ["R","-e","cat('Starting app at', Sys.time(), '\\n'); options(shiny.host='0.0.0.0', shiny.port=as.integer(Sys.getenv('PORT'))); shiny::runApp('/app')"]
