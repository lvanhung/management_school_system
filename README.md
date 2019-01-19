# Management School System. 

1. Setup & seed database

  - <code>rake db:create</code>: create database
  - <code>rake db:migrate</code>: migration database
  - <code>rake db:seed</code>: create fake data for testing 

2. Start application

  - <code> rails s </code> :start application at port 3000

3. Request to generate CSV 

```
curl --request GET \
         --url http://localhost:3000/export_data \
         --header 'content-type: application/json' \
         --data '{"user_id": 1, "class_id": 1, "school_id": 1 }'
```

The system will be generated a excel file at `public/csv`. Then please change `user_id` in `curl` depend on the role the system will be geneated different type of report. 
I generated `csv` files at public/csv for all cases as example for references
