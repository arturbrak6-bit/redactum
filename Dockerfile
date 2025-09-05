FROM rocker/r-ver:4.4.1

RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev libssl-dev libxml2-dev libfontconfig1-dev \
  && rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages('shiny', repos='https://cloud.r-project.org')"

WORKDIR /app
COPY . /app

ENV PORT=8080
EXPOSE 8080

CMD ["R","-e","options(shiny.host='0.0.0.0', shiny.port=as.integer(Sys.getenv('PORT'))); shiny::runExample('01_hello')"]
