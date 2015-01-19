FROM arokem/torch

RUN cd ~
RUN apt-get update
RUN apt-get install -y ipython ipython-notebook
RUN luarocks install itorch

# Set up the ipython stuff:
ENV PEM_FILE /key.pem
# $PASSWORD will get `unset` within notebook.sh, turned into an IPython style hash
ENV PASSWORD Dont make this your default
ENV USE_HTTP 1

# Add current files to / and set entry point.
ADD . /workspace
WORKDIR /workspace
ADD notebook.sh /notebook.sh
RUN chmod a+x /notebook.sh

EXPOSE 8888

CMD ["/notebook.sh"]

