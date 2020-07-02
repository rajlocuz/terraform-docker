pipeline {
 environment {
 //registry = "rajlocuz/poc-ca"
  registry = "poc-ca"
 //registryCredential = 'rajlocuz-dockerhub'
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
 /*stage('Push Image to Docker Hub') {
 steps{
 script {
 docker.withRegistry( '', registryCredential ) {
 dockerImage.push()
 dockerImage.push('latest')
 }}
 }}*/
  stage('Push to ECR') {
   steps{
    script {
  docker.withRegistry('https://159254558323.dkr.ecr.ap-south-1.amazonaws.com', 'ecr:ap-south-1:AWS-raj-singh-admin') {
  //docker.image('poc-ca').push('latest')
  dockerImage.push()
  dockerImage.push('latest')
  }
    }
   }
  }
 }
}
