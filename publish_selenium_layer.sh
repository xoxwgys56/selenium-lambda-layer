mkdir -p python/bin/
# chromium 64.0.3282.167 (stable channel) for amazonlinux:2017.03
curl -SL https://github.com/adieuadieu/serverless-chrome/releases/download/v1.0.0-37/stable-headless-chromium-amazonlinux-2017-03.zip > headless-chromium.zip
unzip headless-chromium.zip -d python/bin/
curl -SL https://chromedriver.storage.googleapis.com/2.37/chromedriver_linux64.zip > chromedriver.zip
unzip chromedriver.zip -d python/bin/
rm -rf chromedriver.zip headless-chromium.zip
docker run --rm -v $(pwd):/var/task -w /var/task lambci/lambda:build-python3.7 bash -c "pip install selenium -t ./python & pip freeze --path ./python > requirements.txt"
zip -r layer.zip python
# layer case. 
# size limitation is 50Mb
# aws lambda publish-layer-version --layer-name <layer-name> --zip-file fileb://layer.zip --compatible-runtimes python3.7
# s3 case.
aws s3 cp <local-file-path> s3://<bucket-name>/<file-or-dir-name> 
aws lambda publish-layer-version \
    --layer-name <layer name> \
    --description "My Python layer" \
    --license-info "MIT" \
    --content S3Bucket=lambda-layers-ap-northeast-2-123456789012,S3Key=layer.zip \
    --compatible-runtimes python3.7
rm -rf layer.zip python
