FROM rpy2/jupyter:latest

MAINTAINER Andreas Krietemeyer

USER root

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get upgrade

RUN apt-get install -y software-properties-common python-software-properties
RUN apt-get install -y apt-transport-https
RUN apt-get update


RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'
RUN apt-get update


RUN apt-get install -y r-recommended
RUN apt-get install -y python3
RUN apt-get -y install python3-pip
RUN apt-get install -y libgdal-dev libevent-dev python-dev build-essential
RUN add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable
RUN apt update
RUN apt upgrade -y
RUN apt-get install -y gdal-bin python-gdal python3-gdal
RUN apt-get install -y python-gdal
RUN apt-get install -y libproj-dev proj-data proj-bin
RUN apt-get install -y git


RUN pip3 install --upgrade pip

RUN pip3 install jupyter
RUN pip3 install numpy pandas matplotlib rpy2

RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
RUN Rscript -e "install.packages('sp')"
RUN Rscript -e "install.packages('gstat')"
RUN Rscript -e "install.packages('rgdal', type = 'source')"
RUN Rscript -e "install.packages('intamap')"

USER jupyteruser

COPY week_7_spatial_students.ipynb week_7_spatial_students.ipynb
COPY gauge_xy.csv gauge_xy.csv
COPY radar_xy.csv radar_xy.csv
COPY charlotte_2_rg_2011.csv charlotte_2_rg_2011.csv
COPY radar_snap_2011_08_01-00_00.csv ./radar_sent/radar_snap_2011_08_01-00_00.csv
COPY radar_snap_2011_08_05-16_00.csv ./radar_sent/radar_snap_2011_08_05-16_00.csv
COPY radar_snap_2011_08_05-17_00.csv ./radar_sent/radar_snap_2011_08_05-17_00.csv
COPY radar_snap_3h_2011_08_05-15_00.csv ./radar_sent/radar_snap_3h_2011_08_05-15_00.csv
COPY radar_snap_24h_2011_08_05-00_00.csv ./radar_sent/radar_snap_24h_2011_08_05-00_00.csv

