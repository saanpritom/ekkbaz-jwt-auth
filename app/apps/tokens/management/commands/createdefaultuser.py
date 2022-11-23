"""This command will create a superuser.

But the difference between createsuperuser and createdefaultuser command
is that this command will not attempt to create a superuser if already exists.
"""
from django.core.management.base import BaseCommand, CommandError
from django.contrib.auth import hashers
from django.contrib.auth import get_user_model
from django.conf import settings


class Command(BaseCommand):
    """Custom superuser create base command class."""

    help = "Create super user for the application."

    def handle(self, *args, **options):
        """Create the tenant."""
        result = 'Default user created successfully'
        try:
            get_user_model().objects.get(username=settings.DJANGO_SUPERUSER_USERNAME)
            result = 'Default user already exists.'
        except get_user_model().DoesNotExist:
            get_user_model().objects.create(first_name="Default",
                                            last_name="Admin",
                                            username=settings.DJANGO_SUPERUSER_USERNAME,
                                            email=settings.DJANGO_SUPERUSER_EMAIL,
                                            password=hashers.make_password(settings.DJANGO_SUPERUSER_PASSWORD),
                                            is_staff=True,
                                            is_superuser=True)
        except Exception as e:
            raise CommandError(getattr(e, 'message', str(e)))
        self.stdout.write(self.style.SUCCESS(result))
