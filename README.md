It is an simple Django app which uses the services of nginx, docker, maxwell-daemon, and prestodb. It gives an idea that how to configure other backend services to django app.

Create a vitual environment
"""
python -m venv venv
"""

Install all the requirements
"""
pip install -r requirements.txt
"""

Build the docker container
"""
docker-compose up --build
"""
Apply migrations in docker for django app
"""
docker exec -it django_app bash

# Inside the container
python app/manage.py migrate
python app/manage.py createsuperuser

"""