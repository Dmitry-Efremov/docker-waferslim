FROM java:7

ENV FITNESSE=http://fitnesse.org/fitnesse-standalone.jar?responder=releaseDownload&release=20150424

RUN curl -o fitnesse-standalone.jar -L $FITNESSE

RUN apt-get update && \
    apt-get install -y python3.4

RUN wget https://bootstrap.pypa.io/ez_setup.py -O - | python
RUN easy_install ez_setup

RUN curl -o waferslim.zip -L https://pypi.python.org/packages/source/w/waferslim/waferslim-1.0.2-py2.6.zip#md5=acacf783444802677358b8b301ab23f9 

RUN unzip waferslim.zip
RUN cd waferslim-1.0.2 && \
    python setup.py install

RUN easy_install boto

CMD java -jar fitnesse-standalone.jar -p 3680
