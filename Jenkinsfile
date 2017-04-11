node("docker") {
    docker.withRegistry('http://localhost:5000', '7f20c40a-68c3-4aa1-ae6a-3ea7e75b3f08') {
    
        git url: "https://github.com/jaynqac/packer-jenkins-test", credentialsId: 'a23cb82a-5733-49b5-a364-67b467d66304'
    
        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id
    
        stage "build"
        def app = docker.build "tomcat w/ java"
    
        stage "publish"
        app.push 'master'
        app.push "${commit_id}"
    }
}