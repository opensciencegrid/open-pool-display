FROM centos:7

RUN yum -y upgrade && \
    yum -y install epel-release yum-plugin-priorities && \
    yum -y install http://repo.opensciencegrid.org/osg/3.5/osg-3.5-el7-release-latest.rpm    

RUN yum -y --enablerepo=osg-upcoming install \
           condor \
           curl \
           git \
           python-devel \
           python-pip \
           python-setuptools \
           wget

COPY fifemon-condor-probe /fifemon

RUN pip install --upgrade setuptools==41.4.0 && \
    cd /fifemon && \
    python setup.py install
    
COPY entrypoint.sh /opt/entrypoint.sh
COPY fifemon.cfg-development /etc/fifemon.cfg-development
COPY fifemon.cfg-production /etc/fifemon.cfg-production
COPY 50-ospool.conf /etc/condor/config.d/50-ospool.conf

CMD [ "/opt/entrypoint.sh" ]

