pipeline {
 environment {
  //uncomment line 4 & 5 for Docker Hub
  registry = "rajlocuz/poc-ca"
  registryCredential = 'rajlocuz-dockerhub'
  //uncomment line 6 (registry) for ECR
  //registry = "poc-ca"
 dockerImage = ''
 }
 agent any
 stages {
 stage('Cloning Git') {
 steps {
 git 'https://github.com/rajlocuz/terraform-docker.git'
 }
 }
 stage('Building Docker Image') {
 steps{
 script {
 dockerImage = docker.build registry + ":$BUILD_NUMBER"
 //dockerImage = docker.build('poc-ca')
 }
 }
 }
  //Push to Docker Hub - Start
 stage('Push Image to Docker Hub') {
 steps{
 script {
 docker.withRegistry( '', registryCredential ) {
 dockerImage.push()
 dockerImage.push('latest')
 }}
 }}
  //Push to Docker hub - End
  //Push to ECR - Start
  /*stage('Push to ECR') {
   steps{
    script {
  docker.withRegistry('https://159254558323.dkr.ecr.ap-south-1.amazonaws.com', 'ecr:ap-south-1:AWS-raj-singh-admin') {
  //docker.image('poc-ca').push('latest')
  dockerImage.push()
  dockerImage.push('latest')
  }
    }
   }
  }*/
  //Push to ECR - End
 }
}
