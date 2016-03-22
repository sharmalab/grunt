# Build a CentOS based system

# Use CentOS 7, but could be any Linux
FROM centos:7

MAINTAINER "Daniel Blezek" blezek.daniel@mayo.edu

# Create a user and do everything as that user
RUN groupadd -r grunt && useradd -r -g grunt grunt
WORKDIR /grunt

# Change owner of /grunt to the grunt user
RUN chown grunt:grunt /grunt

# Do the rest as the grunt user
USER grunt


# Install files
COPY bin/grunt-docker /grunt/grunt
COPY docker/gruntfile.yml /grunt/gruntfile.yml

# What do we run on startup?
CMD ["/grunt/grunt", "gruntfile.yml"]

# We expose port 9901 by default
EXPOSE 9901:9901
