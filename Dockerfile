from mwaaas/django-sample-packages:0.0.1

# Add source code
ADD . .

RUN chmod u+x app_server.sh

EXPOSE 80


