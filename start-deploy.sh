#getting release branch 
#git checkout release
#getting updates branch
#git pull
#building image
# docker build -t <image> <newName>/<repoName>:<tagName>
docker build -t pikmenu-cam:0.5.0 .
#start application
docker run -itd --network pikmenu --name pikmenu-cam pikmenu-cam:0.5.0