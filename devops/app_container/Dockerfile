from mwaaas/django:0.0.5

RUN mkdir requirements

COPY requirements.txt /root/requirements/

# install requirements
RUN pip install -r /root/requirements/requirements.txt


WORKDIR /root/code


# create
RUN mkdir logs

# to be used by celery to run as root
ENV C_FORCE_ROOT="true"

EXPOSE 3000

