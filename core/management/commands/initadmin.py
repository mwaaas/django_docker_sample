from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from optparse import make_option


class Command(BaseCommand):

    help = "Create superuser"

    option_list = BaseCommand.option_list + (
        make_option('--username', dest='username', help='super user admin'),
        make_option('--password', dest='password', help='super user admin'),
        make_option('--email', dest='email', help='super user email'),
    )

    def handle(self, *args, **options):
        username = options['username']
        password = options['password']
        email = options.get('email', 'admin@example.com')

        if not User.objects.filter(username=username).exists():
            User.objects.create_superuser(username, email, password)
