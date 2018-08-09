node {
    stage('Run GiveItATry') {
        build job: '../../GiveItATry'
    }
    
    stage('Run GiveItASecondTry') {
        build job: '../../GiveItASecondTry'
    }
    
    stage('Run Shell') {
        sh "ls -l"
        sh "env"
    }
}