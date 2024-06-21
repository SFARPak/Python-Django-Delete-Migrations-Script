## Python-Django-Delete-Migrations-Script

This script is to delete all the migrations in your Python Django App.

Use this with caution, this is very early release and you might loose data.

Feel free to contribute.


### Usage
Download script in the Directory where all of your apps are located if apps are in Root Folder You need to download in the Root Folder. See the folder Tree Structure below for reference:
```
+---apps
|   +---cart
|   +---core
|   +---core_api
|   +---customer
|   +---order
|   +---product
|   +---product_api
|   +---delete_migrations.sh   <<<<<<<< This is the location of Script
+---certs
+---public
|   +---media
|   +---static
+---project
|   +---__pycache__
+---winenv
|   +---Include
|   +---Lib
|   +---Scripts
```

#### Download
```
wget https://github.com/SFARPak/Python-Django-Delete-Migrations-Script/blob/main/delete_migrations.sh
```

### Run
```
sh delete_migrations.sh
```
