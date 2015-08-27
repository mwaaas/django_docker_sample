from mwaaas/django:0.0.8

# copy requirements
COPY requirements.txt /root/requirements/

# install requirements
RUN pip install -r /root/requirements/requirements.txt

# Add source code
ADD . .



