# mydemosite
Containerized Static website with Dockerfile

Purpose is to create a website that can be deployed as a container - used in Spinnaker demos

For simple edits make changes to www/index.html 
look for "TODAY IS" or "Spinnaker Demo"

Pushes image to docker repo: away168/mysite

TODO: make fancier edits - maybe add js to implement new scrolling behavior - or move the tool bar? 


Deployment manifest
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: website
  name: website-dev
  namespace: dev
spec:
  replicas: '${ #toInt( parameters.devcount ) }'
  selector:
    matchLabels:
      app: website
  template:
    metadata:
      labels:
        app: website
    spec:
      containers:
        - image: 'away168/mysite:${trigger.tag}'
          name: mysite
          ports:
            - containerPort: 80
```

Service Manifest
```yaml
apiVersion: v1
kind: Service
metadata:
  name: website-dev-service
  namespace: dev
spec:
  ports:
    - port: 80
      protocol: TCP
      targetPort: 80
  selector:
    app: website
  type: LoadBalancer
```