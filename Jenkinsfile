#!groovy

node {

  def err = null
  currentBuild.result = "SUCCESS"

  try {
    stage 'Checkout'
      checkout scm

    stage 'Validate'
      def packer_file = 'packer.json'
      print "Running packer validate on : ${packer_file}"
      sh "/Users/Shared/Jenkins/packer validate ${packer_file}"
      sh "echo ~"

    stage 'Build'
      sh "/Users/Shared/Jenkins/packer build ${packer_file}"

    stage 'Test'
      print "Testing goes here."
  }

  catch (caughtError) {
    err = caughtError
    currentBuild.result = "FAILURE"
  }

  finally {
    /* Must re-throw exception to propagate error */
    if (err) {
      throw err
    }
  }
}
