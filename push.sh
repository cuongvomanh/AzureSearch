urlMReg='10.60.156.72:5000'
sudo docker build ./ -t apache-tomcat:@TAOSEDE_VERSION_ODAY
docker tag apache-tomcat:@TAOSEDE_VERSION_ODAY  $urlMReg/apache-tomcat:@TAOSEDE_VERSION_ODAY
docker push $urlMReg/apache-tomcat:@TAOSEDE_VERSION_ODAY
#ssh $urlMid
#export urlMReg='10.6@TAOSEDE_VERSION_ODAY56.72:5000'
#docker pull $urlMReg/apache-tomcat:@TAOSEDE_VERSION_ODAY
#docker tag $urlMReg/apache-tomcat:@TAOSEDE_VERSION_ODAY einvoiceregistry.azurecr.io/apache-tomcat:@TAOSEDE_VERSION_ODAY
#docker push einvoiceregistry.azurecr.io/apache-tomcat:@TAOSEDE_VERSION_ODAY
#

#sed s/@TAOSEDE_VERSION_ODAY/0.2/g push.sh
