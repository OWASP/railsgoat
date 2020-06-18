## Openshift Deployment
To deploy Railsgoat with Openshift you must first have a working [Openshift Cluster](https://docs.okd.io/latest/welcome/index.html) installed. The Railsgoat Openshift deployment currently supports Postgres on the native Openshift Postgres imagestream.

```bash
$ oc new-project railsgoat --description="Railsgoat Openshift Deployment" --display-name="Railsgoat"
```

## Edit the Build Strategy
Since Railsgoat supports both normal Docker deployment and openshift deployment, the Openshift deployment is located in the `openshift-configs` directory. Find the railsgoat build in your openshift deployment and edit the dockerStrategy so that it reads something like:

```
 strategy:
    dockerStrategy:
      dockerfilePath: openshift-configs/Dockerfile
      from:
        kind: ImageStreamTag
        name: 'ruby:2.6.5'
        namespace: railsgoat
    type: Docker
```

### Creating a Database Service

Although Railsgoat in Openshift can be used with the development SQL Lite database, it also takes advantage of the PostgreSQL database image in Openshift for more creative demonstrations and an expansion of SQL attacks. To create the database service you will use the `oc new-app` command and will need to pass some environment variables. You can change these to anything you want.

```bash
$ oc new-app postgresql -e POSTGRESQL_DATABASE=db_name -e POSTGRESQL_USER=username -e POSTGRESQL_PASSWORD=password
```

You can also set the password for the database admin by appending the previous command with:

```bash
-e POSTGRESQL_ADMIN_PASSWORD=admin_pw
```

To deploy Railsgoat alongside the postgres database, you will need to run:
```bash
$ oc new-app https://github.com/OWASP/railsgoat.git --name=railsgoat -e POSTGRESQL_USER=username -e POSTGRESQL_PASSWORD=password -e POSTGRESQL_DATABASE=db_name -e DATABASE_SERVICE_NAME=postgresql -e RAILS_ENV=openshift
```

If you changed the database environment variables, make sure they match up.

Enter the deployments of your new Railsgoat project and locate the railsgoat deployment config. Add the following to the config under the container object.

```
          command:
          - /bin/bash
          - '-c'
          args:
          - rails server -p 3000 -b 0.0.0.0
          ports:
            - containerPort: 3000
              protocol: TCP
```

From the openshift console run the following where `<RAILSGOAT POD ID>` is the active pod (for example, `railsgoat-2-dkalf`):

```bash
$ oc rsh <RAILSGOAT POD ID>
```

From the terminal:

```bash
$ rails db:migrate
```

Create the railsgoat service using the template in the openshift-configs folder by either creating it in the openshift terminal window or pulling it directly from git.

```bash
$ oc create -f https://raw.githubusercontent.com/relotnek/railsgoat/master/openshift-configs/railsgoatservice.yaml
```

Expose the service

```bash
$ oc expose service railsgoat
```

Once the railgoat deployment is running navigate to the indicated route