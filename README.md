# AIO Logs
A Frontend for the logs service from AIO Commons

Made in Flutter Web, you can integrate this web application  
in your aio_bequiend/static folder.

To use it:  

```
$ flutter create --org <your.company> <project.name>
```

Copy the **main_example.dart** and rename it to **main.dart**  
You can add a development entrypoint, named **main_dev.dart**  

Edit the connection strings as the **main_example.dart** dictates.

Copy the **assets/** folder and change the **assets/png/** files, but  
mantain the names. The app recognizes the images by them.

Copy the **compile** and **run** scripts, this will be very useful  
to run, develop and deploy your custom logs webapp.