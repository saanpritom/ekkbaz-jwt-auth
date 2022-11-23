# JWT Authentication Microservice

A Python Django Rest Framework based microservice to authenticate user and generate JWT Token. When an
existed user enter his/her **username** and **password** then this application simply verify the user
and generate an **access_token** and a **refresh_token** for the user.

## How to run the service

Simply follow the below commands sequentially.

- Create a **.env** file on the root directory. You can copy **.env.example** file and rename it to **.env** file. However, the value of those environment variables may change from machine to machine.

- Install application dependencies

```bash
 pip install -r requirements.txt
```

- Run the following command. This command will satisfy all the internal dependencies of the application.

```bash
bash setup.sh
```

- Run the application.

```bash
python app/manage.py runserver
```


## Generate JWT Token

A default superuser is already created during the project initialization. You can use the user's username
and password to test the JWT Token. The value of the default user's **username** and **password** is
mentioned on the **.env** file's `DJANGO_SUPERUSER_USERNAME` and `DJANGO_SUPERUSER_PASSWORD` respectively.

- To generate access token and refresh token visit this link.

```link
https://{your-server-domain}/auth/api/token/
```

- To get a refreshed token visit this link. You need the generated refresh token as the input here.

```link
https://{your-server-domain}/auth/api/token/refresh/
```

<sup> [Pritom Borogoria](https://github.com/saanpritom) reserves all right.</sup>