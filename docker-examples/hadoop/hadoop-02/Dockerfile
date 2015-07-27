# Base this image off an existing hadoop docker image
FROM sequenceiq/hadoop-docker:2.7.0

# Throw in the wordcount-java into the container
RUN mkdir /home/wordcount-java
COPY wordcount-java /home/wordcount-java/