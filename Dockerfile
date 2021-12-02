FROM rocker/tidyverse

# install R packages like this
# put as close to top of script as possible to make best 
# use of caching and speed up builds
RUN Rscript -e "install.packages('wesanderson')"

RUN Rscript -e "install.packages('dplyr')"

RUN Rscript -e "install.packages('car')"

RUN Rscript -e "install.packages('here')"

RUN mkdir /FP

# copy contents of local folder to project folder in container
COPY ./ /FP/

# make R scripts executable
RUN chmod +x /FP/R/*.R

# set an environment variable
ENV which_dataset="mtcars"

WORKDIR /FP

# make container entry point bash
CMD make report