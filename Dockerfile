FROM scipy

MAINTAINER Andreas Krietemeyer

USER root

RUN apt-get update

RUN apt-get install r-recommended
RUN pip install rpy2
RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
RUN Rscript -e "install.packages('sp')"
RUN Rscript -e "install.packages('gstat')"
RUN Rscript -e "install.packages('intamap')"
