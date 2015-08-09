from mwaaas/django-sample-packages:0.0.2

# Add source code
ADD . .

RUN chmod u+x app_server.sh

EXPOSE 80


