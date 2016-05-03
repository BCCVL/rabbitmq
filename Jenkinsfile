node {

    // fetch source
    stage 'Checkout'

    checkout scm

    // build image
    stage 'Build'

    def imagename = 'hub.bccvl.org.au/rabbitmq/rabbitmq'
    def img = docker.build(imagename)

    // publish image to registry
    stage 'Publish'

    def imagetag = rpm_version(img, 'rabbitmq-server')
    img.push(imagetag)

}

def rpm_version(img, pkg) {

    def rpm_version

    img.inside() {
        sh("rpm -q --queryformat '%{VERSION}-%{RELEASE}' > RPM_VERSION')
        rpm_version = readFile('RPM_VERSION')
    }

    return rpm_version
}
