set ADO_URL = https://dev.azure.com/xkit/

docker build -t autoado:latest --secret id=pat,src=pat.txt --build-arg ADO_URL=%ADO_URL% .
if errorlevel 1 exit /b 1
:repeat
docker rm -f autoado
docker run --privileged=true -v /var/run/docker.sock:/var/run/docker.sock -it --name autoado autoado ./run.sh --once
if exist stop goto :eof
goto :repeat
#docker exec -it autoado bash
