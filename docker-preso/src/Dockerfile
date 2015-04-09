# To build the image from this file, cd into the directory hosting this Dockerfile and type:
#     docker build --tag="zetaris/reveal.js" --rm=true ./
# To fire up a container from this image, run this command:
#     docker run --name="zetaris-reveal" -p 8000:8000 -p 35729:35729 -it -v $(pwd):/slides zetaris/reveal.js

FROM ubuntu:14.04

# Install system stuff
RUN apt-get update
RUN apt-get -y install curl
RUN apt-get -y install git

# Node stuff
# ref: https://github.com/hbouvier/docker-cloud9/blob/master/Dockerfile
RUN git clone git://github.com/creationix/nvm.git ~/.nvm
RUN /bin/bash -c '. ~/.nvm/nvm.sh && nvm install v0.10.34 && nvm use v0.10.34 && nvm alias default v0.10.34 && ln -s ~/.nvm/v0.10.34/bin/node /usr/bin/node && ln -s ~/.nvm/v0.10.34/bin/npm /usr/bin/npm'
RUN /bin/bash -c 'export PATH=./node_modules/.bin:$PATH'
RUN /bin/bash -c 'curl https://npmjs.org/install.sh -L -o ~/npm-install.sh && . ~/npm-install.sh && nvm use v0.10.34 && nvm alias default v0.10.34'

# Set up NPM
RUN npm install -g npm

# Install grunt
RUN npm install -g grunt
RUN npm install -g grunt-cli

# Slide server and and livereload ports
EXPOSE 8000 35729

# SET HOME DIR
RUN mkdir slides
WORKDIR /slides

# Default command when container starts
CMD npm install && grunt serve