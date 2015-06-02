FROM java:7

ENV FITNESSE=http://fitnesse.org/fitnesse-standalone.jar?responder=releaseDownload&release=20150424

RUN curl -o fitnesse-standalone.jar -L $FITNESSE

RUN apt-get update && \
    apt-get install -y python2.7

RUN curl -o waferslim.zip -L https://pypi.python.org/packages/source/w/waferslim/waferslim-1.0.2-py3.1.zip#md5=0a64e550f67b3e02d99373d83498547d

RUN unzip waferslim.zip
RUN cd waferslim-1.0.2 && \
    python setup.py install

CMD java -jar fitnesse-standalone.jar -p 3680
