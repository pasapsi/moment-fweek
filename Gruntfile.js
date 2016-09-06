
module.exports = function(grunt) {
    grunt.initConfig({

        // Metadata.
        pkg: grunt.file.readJSON('package.json'),
        banner: '/*! \n * <%= pkg.title || pkg.name %> v<%= pkg.version %>\n' +
        ' * <%= pkg.homepage %>\n' +
        ' * Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author %>\n' +
        ' * License: <%= pkg.license %>\n' +
        ' */\n',

        // Task configuration.
        uglify: {
            options: {
                banner: '<%= banner %>',
                report: 'gzip'
            },
            build: {
                src: 'moment-fweek.js',
                dest: 'moment-fweek.min.js'
            }
        },

        karma: {
            unit: {
                configFile: 'karma.conf.js'
            }
        },

        coffee: {
            compile: {
                files: {
                    'test/fweekSpec.js': 'test/fweekSpec.coffee'
                }
            }
        }


    });

    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-karma');

    grunt.registerTask('test', ['coffee', 'karma']);

    grunt.registerTask('minify', ['uglify']);
};