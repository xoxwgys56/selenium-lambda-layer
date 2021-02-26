AWS lambda & selenium & python is powerful solution, but requirements conflicts are sensitive.
You can upload them as lambda layer and you don't need to be careful and upload them every time ;)

+ run [publish_selenium_layer.sh](https://github.com/xoxwgys56/selenium-lambda-layer/blob/master/publish_selenium_layer.sh)
+ open lambda function and use [lambda_function.py](https://github.com/xoxwgys56/selenium-lambda-layer/blob/master/lambda_function.py) as example.
+ make sure you extend lambda itself time out. (The default is 3 seconds)
+ import the layer above script created.

That's it!

This selenium binaries works with python 3.7. **NOT with 3.8 :(**

If you don't want to create function and import this layer for each scraping purposes, please visit my project [pythonista-chromeless](https://github.com/umihico/pythonista-chromeless/)

> This repositary forked from `umihico`'s repo.

## Usage

1. `chmod +x publish_selenium_layer.sh`
2. run `publish_selenium_layer.sh` (at this time, uploaded on layer)
3. add layer to your lambda function
4. finished
