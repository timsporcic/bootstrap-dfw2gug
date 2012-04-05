modules = {

    bootstrap {
        dependsOn 'jquery'
        resource url: 'js/bootstrap.js'
        resource url: 'css/bootstrap.css'
        resource url: 'css/bootstrap-responsive.css'
        resource url: 'css/custom.css'
    }

    overrides {
        jquery {
            defaultBundle 'bootstrap'
        }
    }
}


